QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    form/form.cpp \
    main.cpp \
    mainWindow/mainwindow.cpp \
    searchResult/searchresult.cpp \
    src/modules/creatingModule/creatingmodule.cpp \
    src/modules/namingModules/namingNotSymbolLinkModule/namingnotsymbollinkmodule.cpp \
    src/modules/namingModules/namingSymbolLinkModule/namingsymbollinkmodule.cpp \
    src/modules/namingModules/namingmodule.cpp \
    src/services/creatingService/creatingservice.cpp \
    src/services/namingService/namingservice.cpp \
    sysElem/syselem.cpp \
    thToCopy/threadtocpy.cpp \
    thToRemove/threadtoremove.cpp \
    thToReplace/threadtoreplace.cpp \
    thToSearch/threadtosearch.cpp

HEADERS += \
    form/form.h \
    form/other_functions.h \
    mainWindow/mainwindow.h \
    searchResult/searchresult.h \
    src/localException/localexception.h \
    src/modules/creatingModule/creatingmodule.h \
    src/modules/namingModules/namingNotSymbolLinkModule/namingnotsymbollinkmodule.h \
    src/modules/namingModules/namingSymbolLinkModule/namingsymbollinkmodule.h \
    src/modules/namingModules/namingmodule.h \
    src/services/creatingService/creatingservice.h \
    src/services/namingService/namingservice.h \
    sysElem/syselem.h \
    thToCopy/threadtocpy.h \
    thToRemove/threadtoremove.h \
    thToReplace/threadtoreplace.h \
    thToSearch/threadtosearch.h

FORMS += \
    form/form.ui \
    mainWindow/mainwindow.ui \
    searchResult/searchresult.ui \
    src/modules/creatingModule/creationmodule.ui \
    src/modules/namingModules/namingNotSymbolLinkModule/namingnotsymbollinkmodule.ui \
    src/modules/namingModules/namingSymbolLinkModule/namingsymbollinkmodule.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resources/resources.qrc
