/*
 * Copyright (C) 2021 The PixelExperience Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <gui/SurfaceComposerClient.h>

namespace android {

extern "C" void _ZN7android21SurfaceComposerClient11Transaction20setDisplayProjectionERKNS_2spINS_7IBinderEEEjRKNS_4RectES9_(const sp<IBinder>& token,uint32_t orientation,const android::Rect& layerStackRect,const android::Rect& displayRect) {
  android::SurfaceComposerClient::Transaction *t = nullptr;
  t->setDisplayProjection(token, static_cast<android::ui::Rotation>(orientation), layerStackRect, displayRect);

}
