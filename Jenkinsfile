#!groovy
import groovy.json.JsonSlurperClassic

node {
     def toolbelt = tool 'sfdx'
    def JWT_KEY_CRED_ID = env.SERVER_KEY_CREDENTALS_ID
     def SF_INSTANCE_URL = env.SF_INSTANCE_URL
     def SF_CONSUMER_KEY = env.SF_CONSUMER_KEY
     def SF_USERNAME = env.SF_USERNAME
      withCredentials([file(credentialsId: 'SERVER_KEY_CREDENTALS_ID', variable: 'FILE')]) {
   
        stage('Validate Org') {
           rc = command "${toolbelt}/sfdx auth:jwt:grant --instanceurl ${SF_INSTANCE_URL} --clientid ${SF_CONSUMER_KEY} --jwtkeyfile ${FILE} --username ${SF_USERNAME} --setalias UAT"
          
           rc = command "${toolbelt}/sfdx force:source:deploy -c -p force-app/main/default -u UAT"

        }
      }
    }
