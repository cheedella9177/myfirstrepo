#!groovy
import groovy.json.JsonSlurperClassic

node {
     def toolbelt = tool 'sfdx' 
    
     withEnv(["HOME=${env.WORKSPACE}"]) {	
      withCredentials([file(credentialsId: 'SERVER_KEY_CREDENTALS_ID', variable: 'FILE'),string(credentialsId: 'SF_CONSUMER_KEY', variable: 'credentialsVariable'),string(credentialsId: 'SF_INSTANCE_URL', variable: 'INSTANCE_url'),string(credentialsId: 'SF_CONSUMER_KEY', variable: 'credentialsVariable'),string(credentialsId: 'SF_USERNAME', variable: 'UNAME')]) {
	stage('Install sgd-git-delta plugin') {
            rc = command "${toolbelt}/sfdx plugins:install sfdx-git-delta"
        }
   
        stage('Authorize the org') {
		println("authorizing") 
            rc = command "${toolbelt}/sfdx auth:jwt:grant --instanceurl ${INSTANCE_url} --clientid ${credentialsVariable} --jwtkeyfile ${FILE} --username ${UNAME} --setalias UAT"
		   
        }
	stage('Identify Delta Changes') {
		println("Identiy Delta changes") 
	   rc = command "${toolbelt}/sfdx-git-delta --to HEAD --from HEAD~1 --output delta.xml"
		println("Delta changes")
		println ${delta.xml}
        }

         stage('Deploy Changes') {
		 println("Deploy changes") 
           rc = command "${toolbelt}/sf project deploy start --manifest delta.xml --target-org -u UAT --wait"
        }

      }
}
    }
def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
		return bat(returnStatus: true, script: script);
    }
}
