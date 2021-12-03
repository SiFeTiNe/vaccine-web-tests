*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://vaccine-haven.herokuapp.com/
${browser}    chrome
${citizen_id}    9621054562944
${firstname}    Sahatsawat
${lastname}    KANPAI
${birth_date}    10/21/2000
${occupation}    INFP
${phone_number}    0923995853
${address}    INFP 9w1 sp/sx 945 RLUAI Phlegmatic-Melancholic
${site_name}    OGYHSite
${vaccine_name}    Astra

*** Keywords ***
Open Vaccine Haven Website
    open browser    ${url}    ${browser}
    set selenium speed    1.5

Go To Home Page
    click element    id:nav__home__link

Go To Reservation Page
    click element    id:reserve__link

Select My Info
    element should be visible    link:My Info

Select Walk In
    element should be visible    link:Walk-in

Create The Reservation
    Go To Reservation Page
    Input Text    id:citizen_id    ${citizen_id}
    click element    xpath=//select[@name="site_name"]
    click element    xpath=//option[@value="${site_name}"]
    click element    xpath=//select[@name="vaccine_name"]
    click element    xpath=//option[@value="${vaccine_name}"]
    click button    xpath=//button[@type='submit']

Check Information
    click link    link=My Info
    input text    name=citizen_id   ${citizen_id}
    click button    xpath://button[@type='submit']
    page should contain    ${citizen_id}
    page should contain    ${firstname}
    page should contain    ${lastname}
    page should contain    ${occupation}
    page should contain    ${phone_number}
    page should contain    ${address}
    page should contain    ${site_name}
    page should contain    ${vaccine_name}

Cancel The Reservation
    click button    id=cancel__btn

Check Reservation Canceling
    click link    link=My Info
    input text    name=citizen_id   ${citizen_id}
    click button    xpath://button[@type='submit']
    page should not contain    ${site_name}

*** Test Cases ***
Open Vaccine Haven Website
    Open Vaccine Haven Website

My Info Button Checking
    Select My Info

Walk In Button Checking
    Select Walk In

Reservation Making
    Create The Reservation

Information Checking
    Check Information

Reservation Canceling
    Cancel The Reservation

Check Reservation Canceling
	Check Reservation Canceling
    Close Browser
