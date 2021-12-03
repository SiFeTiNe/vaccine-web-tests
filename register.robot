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

*** Keywords ***
Open Vaccine Haven Website
    open browser    ${url}    ${browser}
    set selenium speed    1.5

Go To Registration Page
    click element    id:register__link

Register
    Go To Registration Page
    input text    id:citizen_id    ${citizen_id}
    input text    id:name    ${firstname}
    input text    id:surname    ${lastname}
    input text    id:birth_date    ${birth_date}
    input text    id:occupation    ${occupation}
    input text    id:phone_number    ${phone_number}
    input text    id:address    ${address}
    click button    id:register__btn

*** Test Cases ***
Registeration
    Open Vaccine Haven Website
    Register
    Close Browser
