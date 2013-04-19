######################################################################
# generated by pvdevelop at: Mi Nov 8 11:58:45 2006
######################################################################

TEMPLATE = app
CONFIG  += warn_on release qt console
QT      += sql
DEFINES += LUA
DEFINES += "WINVER=0x0501"

# Input
SOURCES     += main.cpp                                   \       
               ../../sql/qtdatabase.cpp                   \
               ../../language_binding_rllib_wrap_lua.cxx  \
               ../../language_binding_wrap_lua.cxx        \
               ../../pvmain.cpp
INCLUDEPATH += ../lua-5.1/src/
unix:LIBS          += ../lua-5.1/src/liblua.a
win32:LIBS         += ../lua-5.1/src/release/liblua.a

!macx {
unix:LIBS          += ../../../pvserver/libpvsmt.so -lpthread
unix:INCLUDEPATH   += ../../../pvserver
unix:LIBS          += ../../../rllib/lib/librllib.so
unix:INCLUDEPATH   += ../../../rllib/lib
unix:LIBS          += -ldl
}

macx:LIBS          += ../../../pvserver/libpvsmt.a /usr/lib/libpthread.dylib
macx:INCLUDEPATH   += ../../../pvserver
macx:LIBS          += ../../../rllib/lib/librllib.dylib
macx:INCLUDEPATH   += ../../../rllib/lib

win32-g++ {
QMAKE_LFLAGS       += -static-libgcc
win32:LIBS         += ../../../win-mingw/bin/librllib.a
win32:LIBS         += ../../../win-mingw/bin/libserverlib.a $(MINGWDIR)/lib/libws2_32.a $(MINGWDIR)/lib/libadvapi32.a
win32:INCLUDEPATH  += ../../../rllib/lib
}

#DEFINES += USE_INETD
TARGET = pvapplua
