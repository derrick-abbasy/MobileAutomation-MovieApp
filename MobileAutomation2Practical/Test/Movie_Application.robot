*** Settings ***
Library       AppiumLibrary

*** Variables ***
${AppiumServer}    http://localhost:4723/wd/hub
${DeviceName}      emulator-5554
${PlatformName}    Android
${AppPackage}      com.tengyeekong.movieapp
${AppActivity}     com.tengyeekong.movieapp.ui.MainActivity
${MainPage}        //android.widget.TextView[contains(@text, 'Movie App')]
${ClassNameForImage}      android.widget.ImageView
${FirstMovieDetailImgBound}    [105,275][455,775]
${ButtonAResourceId}    com.tengyeekong.movieapp:id/btnBookMovie
${WebView}    com.tengyeekong.movieapp:id/webView
${BlankScreen}    com.tengyeekong.movieapp:id/recyclerView

# &{User1-Details}   email=derrick.hafiz@socar.my    password=password123
# ${SkipText}        //android.widget.TextView[contains(@text, 'Skip')]
# ${NumberFieldText}    //android.widget.EditText[contains(@text, '1122331144')] 
# ${ContinueFromPHPage}    //android.widget.TextView[contains(@text, 'Continue')]
# ${SignInWithEmail}    //android.widget.TextView[contains(@text, 'Sign In with Email')]
# ${EmailTextField}    //android.widget.EditText[contains(@text, 'name@email.com')]
# ${YourPasswordTextField}    //android.widget.EditText[contains(@text, 'Your Password')]
# ${SignInTextField}    //android.widget.TextView[contains(@text, 'Sign In')]


*** Test Cases ***
Open Application
    [Documentation]    Open the Android application
    [Tags]             Android
    Open Application    ${AppiumServer}    platformName=${PlatformName}    deviceName=${DeviceName}    appPackage=${AppPackage}    appActivity=${AppActivity}    automationName=UiAutomator2


Check Element Visibility
    [Documentation]    Verify element visibility
    [Tags]             Android
    Element Should Be Visible    id=${BlankScreen}


MovieApp Homepage 
    [Documentation]    Verify first movie in list clickable. 
    [Tags]             Android
    Wait Until Page Contains Element    ${MainPage}
    Click Element    xpath=//android.widget.TextView[contains(@text, 'One Shot Left')]


Navigate To Movie1 Details
    [Documentation]    Verify user is navigated to first movie details.
    [Tags]             Android
    Wait Until Page Contains Element    xpath=//*[@bounds='${FirstMovieDetailImgBound}']    20

Click Book The Movie
    [Documentation]    Verify if "book the movie" button clickable.
    [Tags]             Android
    Click Element    id=${ButtonAResourceId}

Navigate To Web Page
    [Documentation]    Verify user get navigated to web page.
    [Tags]             Android
    Wait Until Page Contains Element   ${WebView}    20


# Skip Onboarding Page 
#     [Documentation]    Onboarding page
#     [Tags]             Android
#     Wait Until Page Contains Element    ${SkipText}
#     Click Element      ${SkipText}

# Enter Your Number
#     [Documentation]    Enter Any Number
#     [Tags]             Android
#     Wait Until Page Contains Element    ${NumberFieldText}
#     Click Element      ${NumberFieldText}
#     Input Text         ${NumberFieldText}    12345
#     Click Element      ${ContinueFromPHPage}


# Navigate To Sign In Page 
#     [Documentation]    Need to click on sign in page 
#     [Tags]             Android
#     Wait Until Page Contains Element    ${SignInWithEmail}    100
#     Click Element      xpath=//android.widget.TextView[contains(@text, 'Sign In with Email')]


# Sign In With Valid Credentials
#     [Documentation]    Sign in with valid email and password
#     [Tags]             Android   
#     Wait Until Page Contains Element    ${EmailTextField}    100
#     Input Text         ${EmailTextField}    derrick.hafiz@socar.my
#     Input Text         ${YourPasswordTextField}    password123
#     Click Element      ${SignInTextField}

