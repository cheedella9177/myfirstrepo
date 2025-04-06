#!groovy
import groovy.json.JsonSlurperClassic

node {
     def toolbelt = tool 'sfdx' 
    
     withEnv(["HOME=${env.WORKSPACE}"]) {	
      withCredentials([file(credentialsId: 'SERVER_KEY_CREDENTALS_ID', variable: 'FILE'),string(credentialsId: 'SF_CONSUMER_KEY', variable: 'credentialsVariable'),string(credentialsId: 'SF_INSTANCE_URL', variable: 'INSTANCE_url'),string(credentialsId: 'SF_CONSUMER_KEY', variable: 'credentialsVariable'),string(credentialsId: 'SF_USERNAME', variable: 'UNAME')]) {
   
        stage('Authorize the org') {
            rc = command "${toolbelt}/sfdx auth:jwt:grant --instanceurl ${INSTANCE_url} --clientid ${credentialsVariable} --jwtkeyfile ${FILE} --username ${UNAME} --setalias UAT"
		   
        }
	stage('Identify Delta Changes') {
	   rc = command "${toolbelt}/sfdx-git-delta --to HEAD --from HEAD~1 --output delta.xml"
        }

         stage('validate') {
            rc = command "${toolbelt}/sfdx force:source:deploy -p force-app/main/default -u UAT -c"
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
