*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${BROWSER}        Chrome
${URL}            https://practicesoftwaretesting.com/


*** Test Cases ***
# Click on first product   
Check on First Product
    Open Website
    sleep    5
    Click Element                    //html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a[1]/div[2]
    sleep    3
    Element Should Be Visible        //html/body/app-root/div/app-detail/div[1]/div[1]/figure/div/img
    Element should Contain           //html/body/app-root/div/app-detail/div[1]/div[2]       Combination Pliers
    Element Should Be Visible        //*[@id="description"]
    Capture Page Screenshot
    sleep    3
    Click Element                    //*[@id="Layer_1"]
    sleep    3


# Sorting by Name (A-Z)
Sorting products by Name A to Z
    scroll element into view         //*[@id="filters"]/h4[4]
    select from list by label        //*[@id="filters"]/form[1]/div/select       Name (A - Z)
    sleep    5
    Drag and Drop By Offset          //*[@id="filters"]/div[1]/ngx-slider/span[6]       -86        0  
    sleep    3
    Element Should Contain           //html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a[1]/div[2]         Adjustable Wrench
    sleep    3

# Sorting by Name (Z-A)
Sorting products by Name Z to A
    select from list by label        //*[@id="filters"]/form[1]/div/select       Name (Z - A)
    sleep    3
    Element Should Contain           //html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a[1]/div[2]         Wood Saw
    sleep    3 


# Sorting by Price (High to Low)
Sorting products by Price High to Low
    select from list by label        //*[@id="filters"]/form[1]/div/select       Price (High - Low)
    sleep    5
    Drag and Drop By Offset          //*[@id="filters"]/div[1]/ngx-slider/span[6]       200        0
    sleep    3
    Element Should Contain           //html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a[1]/div[2]          Workbench with Drawers
    sleep    2

# Sorting by Price (Low to High)
Sorting products by Price Low to High
    select from list by label        //*[@id="filters"]/form[1]/div/select       Price (Low - High)
    sleep    3
    Element Should Contain           //html/body/app-root/div/app-overview/div[3]/div[2]/div[1]/a[1]/div[2]          Washers
    sleep    2


# Contact Us
Send a Message
    Click Link                      //*[@id="navbarSupportedContent"]/ul/li[3]/a
    sleep    2
    Input Text                      id=first_name       AA
    Input Text                      id=last_name        AA
    Input Text                      id=email            AAAA@gmail.com
    Select From List By Label       id=subject          Return
    Scroll Element Into View        id=message
    sleep    1
    Input Text                      id=message          Quality is not an act, it is a habit. Strive for excellence every day!
    sleep    2
    Click Button                    //html/body/app-root/div/app-contact/div/div/div/form/div/div[2]/div[4]/input
    sleep    2
    Element Should Be Visible       //html/body/app-root/div/app-contact/div/div/div         Thanks for your message! We will contact you shortly.                 
    Capture Page Screenshot
    sleep    1 
    [tearDown]    Close Browser


*** Keywords ***
Open Website
    Open Browser        ${URL}        ${BROWSER}
    Maximize Browser Window
    
    
