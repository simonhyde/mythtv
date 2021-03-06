#ifndef MYTH_SCREENSAVER_OSX_H
#define MYTH_SCREENSAVER_OSX_H

#include "screensaver.h"

class ScreenSaverOSX : public ScreenSaver
{
public:
    ScreenSaverOSX();
    ~ScreenSaverOSX();

    void Disable(void);
    void Restore(void);
    void Reset(void);

    bool Asleep(void);

protected:
    class ScreenSaverOSXPrivate *d {nullptr};
};

#endif // MYTH_SCREENSAVER_OSX_H

