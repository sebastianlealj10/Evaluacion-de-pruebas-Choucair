*** Settings ***
Documentation   Existe en un documento de texto con los pasos manuales
...             Esta es mi primera automatizacion
Library         SeleniumLibrary
Library         String

*** Variables ***
${Navegador}            chrome
${URL}               	https://www.choucairtesting.com/
@{MenuNavegador}    //*[@id="menu-item-870"]    //*[@id="menu-item-1876"]   //*[@id="menu-item-7979"]/a   //*[@id="menu-item-550"]     //*[@id="menu-item-7313"]/a    //*[@id="menu-item-282"]/a
@{TituloSector}     //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img       //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[2]/div/div/div/div/div/div/div/div/div/div[1]/div[7]/a       //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img


*** Keywords ***
Navegador y logo
	Open Browser					${URL}		${Navegador}
    Maximize Browser Window
	Title Should Be 				Choucair Testing
	Wait Until Element Is Visible	xpath=//*[@id="slideshow"]/div[2]/div/h2     00:05:00
	Click Element 					xpath=//*[@id="menu-item-6142"]/a
	#Title Should Be 				'Servicios – Choucair Testing'
	Wait Until Element Is Visible	xpath=//*[@id="main"]/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img     00:05:00
*** Test Cases ***
C01 Regresar a página de inicio
    [Tags]                              Test1
	Navegador y logo
	Click Element		xpath=//*[@id="masthead"]/div/div/div/div[1]/a/img
	Title Should Be 				Choucair Testing
	Wait Until Element Is Visible	xpath=//*[@id="slideshow"]/div[2]/div/h2
	Close Browser

C02 Menú de navegación
    [Tags]                              Test2
    Navegador y logo
    FOR    ${i}    IN      @{MenuNavegador}
        #Set Focus To Element    xpath=${i}
        Click Element      xpath=${i}
        Wait Until Element Is Visible     xpath=${i}
        Click Element   xpath=//*[@id="menu-item-6142"]/a
        Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img     00:05:00
    END
    Close Browser

C04 Menú navegación, sección servicios.
    [Tags]                              Test4
    Navegador y logo
    Click Element                   xpath=//*[@id="menu-item-6142"]/a
    Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img     00:05:00
    Close Browser

C05 Clic imagen de enlace de capacidades
    [Tags]                              Test5
    Navegador y logo
    Set Focus To Element            xpath=//*[@id="main"]/div/div/div/div/section[3]
    Click Element                   xpath=//*[@id="main"]/div/div/div/div/section[3]/div/div/div[1]/div/div/div/div/div/figure/a/img
    ${name}     SeleniumLibrary.Get Title
    #title   Select Window  title=My Document    Matches by window title
    #name    Select Window  name=${name}
    #Select Window
    Title Should Be     Servicios – Choucair Testing
    #Run Keyword if      '${name}'=='Servicios – Choucair Testing'
    Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[5]/div/div/div/div/div/div[1]/div/h2
    Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[5]/div/div/div/div/div/div[5]/div/div/img
    Close Browser
