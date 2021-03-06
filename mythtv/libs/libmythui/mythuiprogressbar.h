#ifndef MYTHUI_PROGRESSBAR_H_
#define MYTHUI_PROGRESSBAR_H_

#include "mythuitype.h"

/** \class MythUIProgressBar
 *
 * \brief Progress bar widget.
 *
 * \ingroup MythUI_Widgets
 */
class MUI_PUBLIC MythUIProgressBar : public MythUIType
{
  public:
    MythUIProgressBar(MythUIType *parent, const QString &name)
        : MythUIType(parent, name) {}
   ~MythUIProgressBar() = default;

    void Reset(void) override; // MythUIType

    enum LayoutType { LayoutVertical, LayoutHorizontal };
    enum EffectType { EffectReveal, EffectSlide, EffectAnimate };

    void SetStart(int);
    void SetUsed(int);
    void SetTotal(int);
    int  GetUsed(void) { return m_current; }
    void SetVisible(bool visible) override; // MythUIType

  protected:
    bool ParseElement(const QString &filename, QDomElement &element,
                      bool showWarnings) override; // MythUIType
    void CopyFrom(MythUIType *base) override; // MythUIType
    void CreateCopy(MythUIType *parent) override; // MythUIType
    void Finalize(void) override; // MythUIType

    LayoutType m_layout {LayoutHorizontal};
    EffectType m_effect {EffectReveal};

    int m_total         {0};
    int m_start         {0};
    int m_current       {0};
    int m_firstdepend   {true};

    void CalculatePosition(void);
};

#endif
