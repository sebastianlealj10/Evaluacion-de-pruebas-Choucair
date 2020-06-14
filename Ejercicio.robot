*** Settings ***
Documentation   Existe en un documento de texto con los pasos manuales
...             Esta es mi primera automatizacion
#robot -T -d reports -n noncritical -i TEXTODELTAGAQUI NOMBREDELARCHIVOAQUI
Library         SeleniumLibrary
Library         String

*** Variables ***
${Navegador}            chrome
${URL}               	https://www.choucairtesting.com/
#@{MenuNavegador}    //*[@id="menu-item-870"]    //*[@id="menu-item-1876"]   //*[@id="menu-item-7979"]/a   //*[@id="menu-item-550"]     //*[@id="menu-item-7313"]/a    //*[@id="menu-item-282"]/a
#@{TituloSector}     //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img       //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[2]      //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img





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
    @{MenuNavegador}=   Create List    //*[@id="menu-item-870"]    //*[@id="menu-item-1876"]   //*[@id="menu-item-7979"]/a   //*[@id="menu-item-550"]     //*[@id="menu-item-7313"]/a    //*[@id="menu-item-282"]/a
    @{TituloSector}=    Create List     //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img       //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[2]      //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img   //*[@id="content"]/div/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img
    ${D}    Set Variable         0
    Navegador y logo
    FOR    ${i}    IN    @{MenuNavegador}
        Click Element      xpath=${i}
        Wait Until Element Is Visible     xpath=${TituloSector}[${D}]   00:05:00
        Click Element   xpath=//*[@id="menu-item-6142"]/a
        Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img     00:05:00
        ${D} =    Evaluate   ${D} + 1
    END
    Close Browser

C04 Menú navegación, sección servicios.
    [Tags]                              Test4
    Navegador y logo
    Click Element                   xpath=//*[@id="menu-item-6142"]/a
    Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[1]/div/div/div/div/div/div/div/div/img     00:05:00
    Close Browser

C05 Dar clic en la imagen de cada una de las opciones del menú de servicios. (Capacidades, cómo lo hacemos y portafolio de soluciones)
    [Tags]                              Test5
    @{MenuServicio}     Create List    //*[@id="main"]/div/div/div/div/section[3]/div/div/div[1]/div/div/div/div/div/figure/a/img   //*[@id="main"]/div/div/div/div/section[3]/div/div/div[2]/div/div/div/div/div/figure/a/img      //*[@id="main"]/div/div/div/div/section[3]/div/div/div[3]/div/div/div/div/div/figure/a/img
    @{TitOpcServicio}   Create List    //*[@id="main"]/div/div/div/div/section[5]/div/div/div/div/div/div[1]/div/h2     //*[@id="main"]/div/div/div/div/section[8]/div/div/div/div/div/div/div/div/img      //*[@id="main"]/div/div/div/div/section[10]/div/div/div/div/div/div[1]/div/h2
    ${contador}     Set Variable    0
    Navegador y logo
    Set Focus To Element            xpath=//*[@id="main"]/div/div/div/div/section[3]
    Click Image                     xpath=${MenuServicio}[1]
    Title Should Be     Servicios – Choucair Testing
    Wait Until Element Is Visible   xpath=${TitOpcServicio}[1]    00:05:00
    Scroll Element Into View        xpath=//*[@id="main"]/div/div/div/div/section[3]/div/div/div[2]/div/div/div/div/div/figure/a/img
    Wait Until Element Is Visible   xpath=//*[@id="main"]/div/div/div/div/section[3]/div/div/div[2]/div/div/div/div/div/figure/a/img
    Click Element                    xpath=//*[@id="main"]/div/div/div/div/section[3]/div/div/div[2]/div/div/div/div/div/figure/a/img

#    Set Focus To Element            xpath=//*[@id="main"]/div/div/div/div/section[2]/div/div/div/div/div/div[2]/div/div/h6
#    Set Focus To Element            xpath=//*[@id="main"]/div/div/div/div/section[2]/div/div/div/div/div/div[2]
#    Mouse Up    xpath=//*[@id="main"]/div/div/div/div/section[2]/div/div/div/div/div/div[2]
#    Wait Until Element Is Visible            xpath=//*[@id="main"]/div/div/div/div/section[2]/div/div/div/div/div/div[2]

C06 PRUEBA
    [Tags]          Test6
    Navegador y logo
    Scroll Element Into View        xpath=//*[@id="main"]/div/div/div/div/section[10]/div/div/div/div/div/div[1]/div/h2
    Scroll Element Into View        xpath=//*[@id="main"]/div/div/div/div/section[2]/div/div/div/div/div/div[2]/div/div/h6

