#ifndef METADATAFACTORY_H_
#define METADATAFACTORY_H_

// Needed to perform a lookup
#include "metadatacommon.h"
#include "metadataimagedownload.h"
#include "metadatadownload.h"

// Needed to perform scans
#include "videoscan.h"

// Symbol visibility
#include "mythmetaexp.h"

class VideoMetadata;
class RecordingRule;

class META_PUBLIC MetadataFactoryMultiResult : public QEvent
{
  public:
    explicit MetadataFactoryMultiResult(MetadataLookupList res)
        : QEvent(kEventType), m_results(res) {}
    ~MetadataFactoryMultiResult() = default;

    MetadataLookupList m_results;

    static Type kEventType;
};

class META_PUBLIC MetadataFactorySingleResult : public QEvent
{
  public:
    explicit MetadataFactorySingleResult(MetadataLookup *res)
        : QEvent(kEventType), m_result(res)
    {
        if (m_result)
        {
            m_result->IncrRef();
        }
    }
    ~MetadataFactorySingleResult()
    {
        if (m_result)
        {
            m_result->DecrRef();
            m_result = nullptr;
        }
    }

    MetadataLookup *m_result {nullptr};

    static Type kEventType;
};

class META_PUBLIC MetadataFactoryNoResult : public QEvent
{
  public:
    explicit MetadataFactoryNoResult(MetadataLookup *res)
        : QEvent(kEventType), m_result(res)
    {
        if (m_result)
        {
            m_result->IncrRef();
        }
    }
    ~MetadataFactoryNoResult()
    {
        if (m_result)
        {
            m_result->DecrRef();
            m_result = nullptr;
        }
    }

    MetadataLookup *m_result {nullptr};

    static Type kEventType;
};

class META_PUBLIC MetadataFactoryVideoChanges : public QEvent
{
  public:
    MetadataFactoryVideoChanges(QList<int> adds, QList<int> movs,
                                QList<int>dels) : QEvent(kEventType),
                                m_additions(adds), m_moved(movs),
                                m_deleted(dels) {}
    ~MetadataFactoryVideoChanges() = default;

    QList<int> m_additions; // newly added intids
    QList<int> m_moved; // intids moved to new filename
    QList<int> m_deleted; // orphaned/deleted intids

    static Type kEventType;
};

class META_PUBLIC MetadataFactory : public QObject
{

  public:

    explicit MetadataFactory(QObject *parent);
    ~MetadataFactory();

    void Lookup(ProgramInfo *pginfo, bool automatic = true,
           bool getimages = true, bool allowgeneric = false);
    void Lookup(VideoMetadata *metadata, bool automatic = true,
           bool getimages = true, bool allowgeneric = false);
    void Lookup(RecordingRule *recrule, bool automatic = true,
           bool getimages = true, bool allowgeneric = false);
    void Lookup(MetadataLookup *lookup);

    MetadataLookupList SynchronousLookup(QString title,
                                         QString subtitle,
                                         QString inetref,
                                         int season,
                                         int episode,
                                         QString grabber,
                                         bool allowgeneric = false);
    MetadataLookupList SynchronousLookup(MetadataLookup *lookup);

    void VideoScan();
    void VideoScan(QStringList hosts);

    bool IsRunning() { return m_lookupthread->isRunning() ||
                              m_imagedownload->isRunning() ||
                              m_videoscanner->isRunning(); };

    bool VideoGrabbersFunctional();

  private:

    void customEvent(QEvent *levent) override; // QObject

    void OnMultiResult(MetadataLookupList list);
    void OnSingleResult(MetadataLookup *lookup);
    void OnNoResult(MetadataLookup *lookup);
    void OnImageResult(MetadataLookup *lookup);

    void OnVideoResult(MetadataLookup *lookup);

    MetadataDownload      *m_lookupthread  {nullptr};
    MetadataImageDownload *m_imagedownload {nullptr};

    VideoScannerThread *m_videoscanner     {nullptr};
    VideoMetadataListManager *m_mlm        {nullptr};
    bool m_scanning                        {false};

    // Variables used in synchronous mode
    MetadataLookupList m_returnList;
    bool m_sync                            {false};
};

META_PUBLIC LookupType GuessLookupType(ProgramInfo *pginfo);
META_PUBLIC LookupType GuessLookupType(MetadataLookup *lookup);
META_PUBLIC LookupType GuessLookupType(VideoMetadata *metadata);
META_PUBLIC LookupType GuessLookupType(RecordingRule *recrule);
META_PUBLIC LookupType GuessLookupType(const QString& inetref);

#endif
