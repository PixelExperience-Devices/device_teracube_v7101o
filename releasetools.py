#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info, False)

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info, True)

def AddImage(info, basename, dest, incremental):
  name = basename
  if incremental:
    input_zip = info.source_zip
  else:
    input_zip = info.input_zip
  data = input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def AddFirmware(info, basename, dest, dest_second, incremental):
  name = basename
  if incremental:
    input_zip = info.source_zip
  else:
    input_zip = info.input_zip
  data = input_zip.read("RADIO/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))
  if dest_second:
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest_second))

def OTA_InstallEnd(info, incremental):
  info.script.Print("Patching device-tree image...")
  AddImage(info, "dtbo.img", "/dev/block/by-name/dtbo", incremental)
  info.script.Print("Patching firmware images...")
  AddFirmware(info, "logo.bin", "/dev/block/by-name/logo", False, incremental)
  AddFirmware(info, "cam_vpu1.img", "/dev/block/by-name/cam_vpu1", False, incremental)
  AddFirmware(info, "cam_vpu2.img", "/dev/block/by-name/cam_vpu2", False, incremental)
  AddFirmware(info, "cam_vpu3.img", "/dev/block/by-name/cam_vpu3", False, incremental)
  AddFirmware(info, "lk.img", "/dev/block/by-name/lk", "/dev/block/by-name/lk2", incremental)
  AddFirmware(info, "md1img.img", "/dev/block/by-name/md1img", False, incremental)
  AddFirmware(info, "scp.img", "/dev/block/by-name/scp1", "/dev/block/by-name/scp2", incremental)
  AddFirmware(info, "spmfw.img", "/dev/block/by-name/spmfw", False, incremental)
  AddFirmware(info, "sspm.img", "/dev/block/by-name/sspm_1", "/dev/block/by-name/sspm_2", incremental)
  AddFirmware(info, "tee.img", "/dev/block/by-name/tee1", "/dev/block/by-name/tee2", incremental)
  AddFirmware(info, "preloader.img", "/dev/block/mmcblk0boot0", "/dev/block/mmcblk0boot1", incremental)
