*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
# pip install robotframework-jsonlibrary
# DOCS - https://github.com/robotframework-thailand/robotframework-jsonlibrary
Library    Collections

*** Variables ***
${API_Base_Endpoint}    http://thetestingworldapi.com/
${Session_Name}    API_Testing


*** Test Cases ***
TC_001_Request_Fetch_Status_Code_and_Validate_Content
    Create Session        ${Session_Name}        ${API_Base_Endpoint}
    ${Get_Response}       GET on Session         ${Session_Name}           api/StudentsDetails/1000011
    Log To Console        \n${Get_Response}
    ${json_response}      Set Variable           ${Get_Response.json()}
    Log To Console        ${json_response}
    @{first_name_data}    Get Value From Json    ${json_response}          data.first_name
    Log to Console        \n${first_name_data}
    ${f_name}             Get From List          ${first_name_data}        0
    Should Be Equal       ${f_name}              firstTest

# REF: https://youtu.be/-XYHlDkA_tI
