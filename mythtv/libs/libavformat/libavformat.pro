include ( ../../settings.pro )

TEMPLATE = lib
TARGET = mythavformat-$$LIBVERSION
CONFIG += thread dll warn_off
CONFIG -= qt
target.path = $${LIBDIR}
INSTALLS = target

QMAKE_LFLAGS += $$LDFLAGS

INCLUDEPATH -= /usr/local/include /usr/include
INCLUDEPATH += .. ../..

DEFINES += HAVE_AV_CONFIG_H _LARGEFILE_SOURCE

LIBS += $$LOCAL_LIBDIR_X11 $$EXTRALIBS

QMAKE_CLEAN += $(TARGET) $(TARGETA) $(TARGETD) $(TARGET0) $(TARGET1) $(TARGET2)

# Input
HEADERS += avformat.h
HEADERS += avio.h
HEADERS += mpegts.h
HEADERS += os_support.h
HEADERS += qtpalette.h
HEADERS += riff.h
HEADERS += rtsp.h
HEADERS += rtspcodes.h

SOURCES += allformats.c
SOURCES += avio.c
SOURCES += aviobuf.c
SOURCES += cutils.c
SOURCES += metadata.c
SOURCES += metadata_compat.c
SOURCES += options.c
SOURCES += os_support.c
SOURCES += sdp.c
SOURCES += seek.c
SOURCES += utils.c

# muxers/demuxers
contains( CONFIG_AAC_DEMUXER, yes )               { SOURCES *= raw.c id3v1.c id3v2.c }
contains( CONFIG_AC3_DEMUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_AC3_MUXER, yes )                 { SOURCES *= raw.c }
contains( CONFIG_ADTS_MUXER, yes )                { SOURCES *= adtsenc.c }
contains( CONFIG_AEA_DEMUXER, yes )               { SOURCES *= aea.c }
contains( CONFIG_AIFF_DEMUXER, yes )              { SOURCES *= aiffdec.c riff.c }
contains( CONFIG_AIFF_MUXER, yes )                { SOURCES *= aiffenc.c riff.c }
contains( CONFIG_AMR_DEMUXER, yes )               { SOURCES *= amr.c }
contains( CONFIG_AMR_MUXER, yes )                 { SOURCES *= amr.c }
contains( CONFIG_ANM_DEMUXER, yes )               { SOURCES *= anm.c }
contains( CONFIG_APC_DEMUXER, yes )               { SOURCES *= apc.c }
contains( CONFIG_APE_DEMUXER, yes )               { SOURCES *= ape.c apetag.c }
contains( CONFIG_ASF_DEMUXER, yes )               { SOURCES *= asfdec.c asf.c asfcrypt.c riff.c avlanguage.c }
contains( CONFIG_ASF_MUXER, yes )                 { SOURCES *= asfenc.c riff.c }
contains( CONFIG_ASS_DEMUXER, yes )               { SOURCES *= assdec.c }
contains( CONFIG_ASS_MUXER, yes )                 { SOURCES *= assenc.c }
contains( CONFIG_AU_DEMUXER, yes )                { SOURCES *= au.c riff.c }
contains( CONFIG_AU_MUXER, yes )                  { SOURCES *= au.c riff.c }
contains( CONFIG_AVI_DEMUXER, yes )               { SOURCES *= avidec.c riff.c avi.c }
contains( CONFIG_AVI_MUXER, yes )                 { SOURCES *= avienc.c riff.c avi.c }
contains( CONFIG_AVISYNTH, yes )                  { SOURCES *= avisynth.c }
contains( CONFIG_AVM2_MUXER, yes )                { SOURCES *= swfenc.c }
contains( CONFIG_AVS_DEMUXER, yes )               { SOURCES *= avs.c vocdec.c voc.c riff.c }
contains( CONFIG_BETHSOFTVID_DEMUXER, yes )       { SOURCES *= bethsoftvid.c }
contains( CONFIG_BFI_DEMUXER, yes )               { SOURCES *= bfi.c }
contains( CONFIG_BINK_DEMUXER, yes )              { SOURCES *= bink.c }
contains( CONFIG_C93_DEMUXER, yes )               { SOURCES *= c93.c }
contains( CONFIG_CAF_DEMUXER, yes )               { SOURCES *= cafdec.c caf.c mov.c riff.c isom.c }
contains( CONFIG_CAVSVIDEO_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_CDG_DEMUXER, yes )               { SOURCES *= cdg.c }
contains( CONFIG_CRC_MUXER, yes )                 { SOURCES *= crcenc.c }
contains( CONFIG_DAUD_DEMUXER, yes )              { SOURCES *= daud.c }
contains( CONFIG_DAUD_MUXER, yes )                { SOURCES *= daud.c }
contains( CONFIG_DIRAC_DEMUXER, yes )             { SOURCES *= raw.c }
contains( CONFIG_DIRAC_MUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_DNXHD_DEMUXER, yes )             { SOURCES *= raw.c }
contains( CONFIG_DNXHD_MUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_DSICIN_DEMUXER, yes )            { SOURCES *= dsicin.c }
contains( CONFIG_DTS_DEMUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_DTS_MUXER, yes )                 { SOURCES *= raw.c id3v2.c }
contains( CONFIG_DV_DEMUXER, yes )                { SOURCES *= dv.c }
contains( CONFIG_DV_MUXER, yes )                  { SOURCES *= dvenc.c }
contains( CONFIG_DXA_DEMUXER, yes )               { SOURCES *= dxa.c }
contains( CONFIG_EA_CDATA_DEMUXER, yes )          { SOURCES *= eacdata.c }
contains( CONFIG_EA_DEMUXER, yes )                { SOURCES *= electronicarts.c }
contains( CONFIG_EAC3_DEMUXER, yes )              { SOURCES *= raw.c id3v2.c }
contains( CONFIG_EAC3_MUXER, yes )                { SOURCES *= raw.c }
contains( CONFIG_FFM_DEMUXER, yes )               { SOURCES *= ffmdec.c }
contains( CONFIG_FFM_MUXER, yes )                 { SOURCES *= ffmenc.c }
contains( CONFIG_FILMSTRIP_DEMUXER, yes )         { SOURCES *= filmstripdec.c }
contains( CONFIG_FILMSTRIP_MUXER, yes )           { SOURCES *= filmstripenc.c }
contains( CONFIG_FLAC_DEMUXER, yes )              { SOURCES *= flacdec.c raw.c id3v2.c id3v2.c oggparsevorbis.c }
contains( CONFIG_FLAC_MUXER, yes )                { SOURCES *= flacenc.c }
contains( CONFIG_FLIC_DEMUXER, yes )              { SOURCES *= flic.c }
contains( CONFIG_FLV_DEMUXER, yes )               { SOURCES *= flvdec.c }
contains( CONFIG_FLV_MUXER, yes )                 { SOURCES *= flvenc.c avc.c }
contains( CONFIG_FOURXM_DEMUXER, yes )            { SOURCES *= 4xm.c }
contains( CONFIG_FRAMECRC_MUXER, yes )            { SOURCES *= framecrcenc.c }
contains( CONFIG_GIF_MUXER, yes )                 { SOURCES *= gif.c }
contains( CONFIG_GSM_DEMUXER, yes )               { SOURCES *= raw.c id3v2.c }
contains( CONFIG_GIF_DEMUXER, yes )               { SOURCES *= gifdec.c }
contains( CONFIG_GXF_DEMUXER, yes )               { SOURCES *= gxf.c }
contains( CONFIG_GXF_MUXER, yes )                 { SOURCES *= gxfenc.c audiointerleave.c }
contains( CONFIG_H261_DEMUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_H261_MUXER, yes )                { SOURCES *= raw.c }
contains( CONFIG_H263_DEMUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_H263_MUXER, yes )                { SOURCES *= raw.c }
contains( CONFIG_H264_DEMUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_H264_MUXER, yes )                { SOURCES *= raw.c }
contains( CONFIG_IDCIN_DEMUXER, yes )             { SOURCES *= idcin.c }
contains( CONFIG_IFF_DEMUXER, yes )               { SOURCES *= iff.c }
contains( CONFIG_IMAGE2_DEMUXER, yes )            { SOURCES *= img2.c }
contains( CONFIG_IMAGE2_MUXER, yes )              { SOURCES *= img2.c }
contains( CONFIG_IMAGE2PIPE_DEMUXER, yes )        { SOURCES *= img2.c }
contains( CONFIG_IMAGE2PIPE_MUXER, yes )          { SOURCES *= img2.c }
contains( CONFIG_INGENIENT_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_IPMOVIE_DEMUXER, yes )           { SOURCES *= ipmovie.c }
contains( CONFIG_ISS_DEMUXER, yes )               { SOURCES *= iss.c }
contains( CONFIG_IV8_DEMUXER, yes )               { SOURCES *= iv8.c }
contains( CONFIG_LMLM4_DEMUXER, yes )             { SOURCES *= lmlm4.c }
contains( CONFIG_M4V_DEMUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_M4V_MUXER, yes )                 { SOURCES *= raw.c }
contains( CONFIG_MATROSKA_DEMUXER, yes )          { SOURCES *= matroskadec.c matroska.c riff.c isom.c }
contains( CONFIG_MATROSKA_MUXER, yes )            { SOURCES *= matroskaenc.c matroska.c riff.c isom.c avc.c flacenc.c }
contains( CONFIG_MJPEG_DEMUXER, yes )             { SOURCES *= raw.c }
contains( CONFIG_MJPEG_MUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_MLP_DEMUXER, yes )               { SOURCES *= raw.c id3v2.c }
contains( CONFIG_MLP_MUXER, yes )                 { SOURCES *= raw.c }
contains( CONFIG_MM_DEMUXER, yes )                { SOURCES *= mm.c }
contains( CONFIG_MMF_DEMUXER, yes )               { SOURCES *= mmf.c riff.c }
contains( CONFIG_MMF_MUXER, yes )                 { SOURCES *= mmf.c riff.c }
contains( CONFIG_MOV_DEMUXER, yes )               { SOURCES *= mov.c riff.c isom.c }
contains( CONFIG_MOV_MUXER, yes )                 { SOURCES *= movenc.c riff.c isom.c avc.c }
contains( CONFIG_MP2_MUXER, yes )                 { SOURCES *= mp3.c id3v1.c }
contains( CONFIG_MP3_DEMUXER, yes )               { SOURCES *= mp3.c id3v1.c id3v2.c }
contains( CONFIG_MP3_MUXER, yes )                 { SOURCES *= mp3.c id3v1.c id3v2.c }
contains( CONFIG_MPC_DEMUXER, yes )               { SOURCES *= mpc.c id3v1.c id3v2.c apetag.c }
contains( CONFIG_MPC8_DEMUXER, yes )              { SOURCES *= mpc8.c }
contains( CONFIG_MPEG1SYSTEM_MUXER, yes )         { SOURCES *= mpegenc.c }
contains( CONFIG_MPEG1VCD_MUXER, yes )            { SOURCES *= mpegenc.c }
contains( CONFIG_MPEG2DVD_MUXER, yes )            { SOURCES *= mpegenc.c }
contains( CONFIG_MPEG2VOB_MUXER, yes )            { SOURCES *= mpegenc.c }
contains( CONFIG_MPEG2SVCD_MUXER, yes )           { SOURCES *= mpegenc.c }
contains( CONFIG_MPEG1VIDEO_MUXER, yes )          { SOURCES *= raw.c }
contains( CONFIG_MPEG2VIDEO_MUXER, yes )          { SOURCES *= raw.c }
contains( CONFIG_MPEGPS_DEMUXER, yes )            { SOURCES *= mpeg.c }
contains( CONFIG_MPEGTS_DEMUXER, yes )            { SOURCES *= mpegts.c }
contains( CONFIG_MPEGTS_MUXER, yes )              { SOURCES *= mpegtsenc.c }
contains( CONFIG_MPEGVIDEO_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_MPJPEG_MUXER, yes )              { SOURCES *= mpjpeg.c }
contains( CONFIG_MSNWC_TCP_DEMUXER, yes )         { SOURCES *= msnwc_tcp.c }
contains( CONFIG_MTV_DEMUXER, yes )               { SOURCES *= mtv.c }
contains( CONFIG_MVI_DEMUXER, yes )               { SOURCES *= mvi.c }
contains( CONFIG_MXF_DEMUXER, yes )               { SOURCES *= mxfdec.c mxf.c }
contains( CONFIG_MXF_MUXER, yes )                 { SOURCES *= mxfenc.c mxf.c audiointerleave.c }
contains( CONFIG_NC_DEMUXER, yes )                { SOURCES *= ncdec.c }
contains( CONFIG_NSV_DEMUXER, yes )               { SOURCES *= nsvdec.c riff.c }
contains( CONFIG_NULL_MUXER, yes )                { SOURCES *= raw.c }
contains( CONFIG_NUT_DEMUXER, yes )               { SOURCES *= nutdec.c riff.c }
contains( CONFIG_NUT_MUXER, yes )                 { SOURCES *= nutenc.c nut.c riff.c }
contains( CONFIG_NUV_DEMUXER, yes )               { SOURCES *= nuv.c riff.c }
contains( CONFIG_OGG_DEMUXER, yes )               { SOURCES *= oggdec.c oggparsedirac.c oggparsevorbis.c oggparsetheora.c oggparseflac.c oggparseogm.c oggparsespeex.c riff.c }
contains( CONFIG_OGG_MUXER, yes )                 { SOURCES *= oggenc.c }
contains( CONFIG_OMA_DEMUXER, yes )               { SOURCES *= oma.c raw.c }
contains( CONFIG_PCM_ALAW_DEMUXER, yes )          { SOURCES *= raw.c }
contains( CONFIG_PCM_ALAW_MUXER, yes )            { SOURCES *= raw.c }
contains( CONFIG_PCM_F32BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_F32BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_F32LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_F32LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_F64BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_F64BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_F64LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_F64LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_MULAW_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_MULAW_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S16BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S16BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S16LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S16LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S24BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S24BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S24LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S24LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S32BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S32BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S32LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_S32LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_S8_DEMUXER, yes )            { SOURCES *= raw.c }
contains( CONFIG_PCM_S8_MUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_PCM_U16BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U16BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U16LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U16LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U24BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U24BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U24LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U24LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U32BE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U32BE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U32LE_DEMUXER, yes )         { SOURCES *= raw.c }
contains( CONFIG_PCM_U32LE_MUXER, yes )           { SOURCES *= raw.c }
contains( CONFIG_PCM_U8_DEMUXER, yes )            { SOURCES *= raw.c }
contains( CONFIG_PCM_U8_MUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_PVA_DEMUXER, yes )               { SOURCES *= pva.c }
contains( CONFIG_QCP_DEMUXER, yes )               { SOURCES *= qcp.c }
contains( CONFIG_R3D_DEMUXER, yes )               { SOURCES *= r3d.c }
contains( CONFIG_RAWVIDEO_DEMUXER, yes )          { SOURCES *= raw.c }
contains( CONFIG_RAWVIDEO_MUXER, yes )            { SOURCES *= raw.c }
contains( CONFIG_RL2_DEMUXER, yes )               { SOURCES *= rl2.c }
contains( CONFIG_RM_DEMUXER, yes )                { SOURCES *= rmdec.c rm.c }
contains( CONFIG_RM_MUXER, yes )                  { SOURCES *= rmenc.c rm.c }
contains( CONFIG_ROQ_DEMUXER, yes )               { SOURCES *= idroq.c }
contains( CONFIG_ROQ_MUXER, yes )                 { SOURCES *= raw.c }
contains( CONFIG_RPL_DEMUXER, yes )               { SOURCES *= rpl.c }
contains( CONFIG_RTP_MUXER, yes )                 { SOURCES *= rtp.c rtpenc.c rtpenc_mpv.c rtpenc_aac.c rtpenc_amr.c rtpenc_h263.c rtpenc_h264.c avc.c }
contains( CONFIG_RTSP_DEMUXER, yes )              { SOURCES *= rtsp.c }
contains( CONFIG_SDP_DEMUXER, yes )               { SOURCES *= rtsp.c rdt.c rtp.c rtpdec.c rtpdec_h263.c rtp_h264.c rtp_vorbis.c rtp_asf.c }
contains( CONFIG_SEGAFILM_DEMUXER, yes )          { SOURCES *= segafilm.c }
contains( CONFIG_SIFF_DEMUXER, yes )              { SOURCES *= siff.c }
contains( CONFIG_SHORTEN_DEMUXER, yes )           { SOURCES *= raw.c id3v2.c }
contains( CONFIG_SMACKER_DEMUXER, yes )           { SOURCES *= smacker.c }
contains( CONFIG_SOL_DEMUXER, yes )               { SOURCES *= sol.c }
contains( CONFIG_SOX_DEMUXER, yes )               { SOURCES *= soxdec.c raw.c }
contains( CONFIG_SOX_MUXER, yes )                 { SOURCES *= soxenc.c }
contains( CONFIG_SPDIF_MUXER, yes )               { SOURCES *= spdif.c }
contains( CONFIG_STR_DEMUXER, yes )               { SOURCES *= psxstr.c }
contains( CONFIG_SWF_DEMUXER, yes )               { SOURCES *= swfdec.c }
contains( CONFIG_SWF_MUXER, yes )                 { SOURCES *= swfenc.c }
contains( CONFIG_THP_DEMUXER, yes )               { SOURCES *= thp.c }
contains( CONFIG_TIERTEXSEQ_DEMUXER, yes )        { SOURCES *= tiertexseq.c }
contains( CONFIG_TMV_DEMUXER, yes )               { SOURCES *= tmv.c }
contains( CONFIG_TRUEHD_DEMUXER, yes )            { SOURCES *= raw.c id3v2.c }
contains( CONFIG_TRUEHD_MUXER, yes )              { SOURCES *= raw.c }
contains( CONFIG_TTA_DEMUXER, yes )               { SOURCES *= tta.c id3v1.c id3v2.c }
contains( CONFIG_TXD_DEMUXER, yes )               { SOURCES *= txd.c }
contains( CONFIG_VC1_DEMUXER, yes )               { SOURCES *= raw.c }
contains( CONFIG_VC1T_DEMUXER, yes )              { SOURCES *= vc1test.c }
contains( CONFIG_VC1T_MUXER, yes )                { SOURCES *= vc1testenc.c }
contains( CONFIG_VMD_DEMUXER, yes )               { SOURCES *= sierravmd.c }
contains( CONFIG_VOC_DEMUXER, yes )               { SOURCES *= vocdec.c voc.c riff.c }
contains( CONFIG_VOC_MUXER, yes )                 { SOURCES *= vocenc.c voc.c riff.c }
contains( CONFIG_VQF_DEMUXER, yes )               { SOURCES *= vqf.c }
contains( CONFIG_W64_DEMUXER, yes )               { SOURCES *= wav.c riff.c raw.c }
contains( CONFIG_WAV_DEMUXER, yes )               { SOURCES *= wav.c riff.c }
contains( CONFIG_WAV_MUXER, yes )                 { SOURCES *= wav.c riff.c }
contains( CONFIG_WC3_DEMUXER, yes )               { SOURCES *= wc3movie.c }
contains( CONFIG_WSAUD_DEMUXER, yes )             { SOURCES *= westwood.c }
contains( CONFIG_WSVQA_DEMUXER, yes )             { SOURCES *= westwood.c }
contains( CONFIG_WV_DEMUXER, yes )                { SOURCES *= wv.c }
contains( CONFIG_XA_DEMUXER, yes )                { SOURCES *= xa.c }
contains( CONFIG_YUV4MPEGPIPE_MUXER, yes )        { SOURCES *= yuv4mpeg.c }
contains( CONFIG_YUV4MPEGPIPE_DEMUXER, yes )      { SOURCES *= yuv4mpeg.c }

# external libraries
contains( CONFIG_LIBDC1394_DEMUXER, yes )         { SOURCES *= libdc1394.c }
contains( CONFIG_LIBNUT_DEMUXER, yes )            { SOURCES *= libnut.c riff.c }
contains( CONFIG_LIBNUT_MUXER, yes )              { SOURCES *= libnut.c riff.c }

# protocols I/O
contains( CONFIG_FILE_PROTOCOL, yes )             { SOURCES *= file.c }
contains( CONFIG_GOPHER_PROTOCOL, yes )           { SOURCES *= gopher.c }
contains( CONFIG_HTTP_PROTOCOL, yes )             { SOURCES *= http.c }
contains( CONFIG_PIPE_PROTOCOL, yes )             { SOURCES *= file.c }
contains( CONFIG_RTMP_PROTOCOL, yes )             { SOURCES *= rtmpproto.c rtmppkt.c }
contains( CONFIG_RTP_PROTOCOL, yes )              { SOURCES *= rtpproto.c }
contains( CONFIG_TCP_PROTOCOL, yes )              { SOURCES *= tcp.c }
contains( CONFIG_UDP_PROTOCOL, yes )              { SOURCES *= udp.c }

# libavdevice dependencies
contains( CONFIG_JACK_INDEV, yes )                { SOURCES *= timefilter.c }

inc.path = $${PREFIX}/include/mythtv/libavformat/
inc.files = avformat.h avio.h rtp.h rtsp.h rtspcodes.h

INSTALLS += inc

LIBS += -L../libavcodec -lmythavcodec-$$LIBVERSION -L../libavutil -lmythavutil-$$LIBVERSION
using_xvmc:LIBS += $$CONFIG_XVMC_LIBS

include ( ../libs-targetfix.pro )
