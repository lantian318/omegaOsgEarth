set(OMEGA_OSG_ENABLE_COLLADA_DOM false CACHE BOOL "")

set(OSGEARTH_ARGS
	 -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
     -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DOSGEARTH_USE_QT=OFF
     -DOSG_DIR:PATH=${OSG_INSTALL_DIR}
     -DGDAL_INCLUDE_DIR=${GDAL_INCLUDE_DIR}
     -DGDAL_LIBRARY=${GDAL_LIBRARY}
)

if(OMEGA_OSG_ENABLE_COLLADA_DOM)
	set(OSGEARTH_ARGS
		 -DMINIZIP_INCLUDE_DIR=${MINIZIP_INCLUDE_DIR}
		 -DMINIZIP_LIBRARY=${MINIZIP_LIBRARY}
		${OSGEARTH_ARGS}
	)
endif()

if(WIN32)
	set(OSGEARTH_ARGS
		   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
		 -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}
		 -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}
		 -DCMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}
		 -DCMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}
		 -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}/osgPlugins-3.3.0
		 -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}/osgPlugins-3.3.0
		 #-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 -DOSGEARTH_USE_QT=OFF
		 -DOSG_DIR:PATH=${OSG_INSTALL_DIR}
		 -DGDAL_INCLUDE_DIR=${GDAL_INCLUDE_DIR}
		 -DGDAL_LIBRARY=${GDAL_LIBRARY}
	)
	# On windows, we specify all the dependencies manually. It's the only
	# way that seems to work. And it's super fun to do.
    set(OSGEARTH_ARGS
        #-DCMAKE_SHARED_LINKER_FLAGS:STRING="${CMAKE_SHARED_LINKER_FLAGS} /NODEFAULTLIB:msvcprt.lib /NODEFAULTLIB:libcpmt.lib"
		#    -DCMAKE_LINKER_FLAGS:STRING="${CMAKE_LINKER_FLAGS} /NODEFAULTLIB:libcpmt.lib /NODEFAULTLIB:msvcprt.lib"
			#osg
			-DOSG_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSG_LIBRARY:PATH=${osg_LIBRARY}
			-DOSG_LIBRARY_DEBUG:PATH=${osg_LIBRARY_DEBUG}
			#osgGA
			-DOSGGA_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGGA_LIBRARY:PATH=${osgGA_LIBRARY}
			-DOSGGA_LIBRARY_DEBUG:PATH=${osgGA_LIBRARY_DEBUG}
			#osgText
			-DOSGTEXT_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGTEXT_LIBRARY:PATH=${osgText_LIBRARY}
			-DOSGTEXT_LIBRARY_DEBUG:PATH=${osgText_LIBRARY_DEBUG}
			#osgViewer
			-DOSGVIEWER_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGVIEWER_LIBRARY:PATH=${osgViewer_LIBRARY}
			-DOSGVIEWER_LIBRARY_DEBUG:PATH=${osgViewer_LIBRARY_DEBUG}
			#osgSim
			-DOSGSIM_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGSIM_LIBRARY:PATH=${osgSim_LIBRARY}
			-DOSGSIM_LIBRARY_DEBUG:PATH=${osgSim_LIBRARY_DEBUG}
			#osgDB
			-DOSGDB_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGDB_LIBRARY:PATH=${osgDB_LIBRARY}
			-DOSGDB_LIBRARY_DEBUG:PATH=${osgDB_LIBRARY_DEBUG}
			#osgUtil
			-DOSGUTIL_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGUTIL_LIBRARY:PATH=${osgUtil_LIBRARY}
			-DOSGUTIL_LIBRARY_DEBUG:PATH=${osgUtil_LIBRARY_DEBUG}
			#osgShadow
			-DOSGSHADOW_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGSHADOW_LIBRARY:PATH=${osgShadow_LIBRARY}
			-DOSSHADOW_LIBRARY_DEBUG:PATH=${osgShadow_LIBRARY_DEBUG}
			#openthreads
			-DOPENTHREADS_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOPENTHREADS_LIBRARY:PATH=${OpenThreads_LIBRARY}
			-DOPENTHREADS_LIBRARY_DEBUG:PATH=${OpenThreads_LIBRARY_DEBUG}
			#osgFX
			-DOSGFX_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGFX_LIBRARY:PATH=${osgFX_LIBRARY}
			-DOSGFX_LIBRARY_DEBUG:PATH=${osgFX_LIBRARY_DEBUG}
			#osgTerrain
			-DOSGTERRAIN_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGTERRAIN_LIBRARY:PATH=${osgTerrain_LIBRARY}
			-DOSGTERRAIN_LIBRARY_DEBUG:PATH=${osgTerrain_LIBRARY_DEBUG}
			#osgManipulator
			-DOSGMANIPULATOR_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGMANIPULATOR_LIBRARY:PATH=${osgManipulator_LIBRARY}
			-DOSGMANIPULATOR_LIBRARY_DEBUG:PATH=${osgManipulator_LIBRARY_DEBUG}
			#osgWidget
			-DOSGWIDGET_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGWIDGET_LIBRARY:PATH=${osgWidget_LIBRARY}
			-DOSGWIDGET_LIBRARY_DEBUG:PATH=${osgWidget_LIBRARY_DEBUG}
			#CURL
			-DCURL_INCLUDE_DIR:PATH=${CMAKE_BINARY_DIR}/gdal/include/curl
			-DCURL_LIBRARY:PATH=${CMAKE_BINARY_DIR}/gdal/lib/libcurl_imp.lib
			-DCURL_LIBRARY_DEBUG:PATH=${CMAKE_BINARY_DIR}/gdal/lib/libcurl_imp.lib
			#ZLIB
			-DZLIB_INCLUDE_DIR:PATH=${CMAKE_BINARY_DIR}/gdal/include/
			-DZLIB_LIBRARY:PATH=${CMAKE_BINARY_DIR}/gdal/lib/zlib.lib
		${OSGEARTH_ARGS}
    )
endif(WIN32)

set(OSGEARTH_DEPENDS osg gdal)
if(OMEGA_OSG_ENABLE_COLLADA_DOM)
	set(OSGEARTH_DEPENDS ${OSGEARTH_DEPENDS} minizip)
endif()

ExternalProject_Add(
    osgearth
    DEPENDS ${OSGEARTH_DEPENDS}
    URL https://omegalib.googlecode.com/files/osgearth-10db273f4f.tar.gz
    CMAKE_ARGS
        ${OSGEARTH_ARGS}
    INSTALL_COMMAND ""
)

set_target_properties(osgearth PROPERTIES FOLDER "modules/omegaOsgEarth")


#set_target_properties(osgearth PROPERTIES FOLDER "3rdparty")

set(OSGEARTH_BASE_DIR ${CMAKE_BINARY_DIR}/modules/omegaOsgEarth/osgearth-prefix/src)
# NOTE: setting the OSGEARTH_INCLUDES as an internal cache variable, makes it accessible to other modules.
set(OSGEARTH_INCLUDES ${OSGEARTH_BASE_DIR}/osgearth/src CACHE INTERNAL "")

set(OSGEARTH_COMPONENTS osgEarth osgEarthAnnotation osgEarthFeatures osgEarthSymbology osgEarthUtil)
if(OMEGA_OS_WIN)
    foreach( C ${OSGEARTH_COMPONENTS} )
        set(${C}_LIBRARY ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE}/osg/osgPlugins-3.3.0/${C}.lib CACHE INTERNAL "")
        set(${C}_LIBRARY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG}/osg/osgPlugins-3.3.0/${C}d.lib CACHE INTERNAL "")
        set(OSGEARTH_LIBS ${OSGEARTH_LIBS} optimized ${${C}_LIBRARY} debug ${${C}_LIBRARY_DEBUG} CACHE INTERNAL "")
    endforeach()
elseif(OMEGA_OS_LINUX)
	# Linux
    foreach( C ${OSGEARTH_COMPONENTS} )
		set(${C}_LIBRARY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0/lib${C}.so)
		set(${C}_LIBRARY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0/lib${C}d.so)
        set(OSGEARTH_LIBS ${OSGEARTH_LIBS} optimized ${${C}_LIBRARY} debug ${${C}_LIBRARY_DEBUG} CACHE INTERNAL "")
  endforeach()
else()
	# OSX
    foreach( C ${OSGEARTH_COMPONENTS} )
		set(${C}_LIBRARY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0/lib${C}.dylib)
		set(${C}_LIBRARY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0/lib${C}d.dylib)
        set(OSGEARTH_LIBS ${OSGEARTH_LIBS} optimized ${${C}_LIBRARY} debug ${${C}_LIBRARY_DEBUG} CACHE INTERNAL "")
	endforeach()
endif()
