TtsqZip and TtsqUnZip components v1.0
=========================================
These two components compress/decompress files using Info-zip's implementations. 
TtsqZip generates PKZIP-compatible archives, which are recognized by most popular compressors 
like Winzip and WinRar. TtsqUnZip unzips an archive into a specified folder. The components 
are built on Theodoros Bebekis's translation of Info-zip's zip32.dll and unzip32.dll.
The key features are:
  * PKZIP-compatible archives
  * free even for commercial use
  * very fast
  * mature and stable
  * easy to use, Howtos included
  * exposing all callbacks of the dlls. ready for custimization.
  * working with the latest versions of zip32.dll and unzip32.dll.


Licence
-----------
TtsqZip and TtsqUnZip are distributed under the terms of the MPL 1.1. In short, there is 
no WARRANTY of any kind. You can use these components for any purpose, including commercial one. 
For details, read the accompanying files 'MPL-1.1.txt' and 'COPYRIGHT'. For the licence regarding
using of zip32.dll and unzip32.dll, see LICENCE.

Files
-----
  README.txt   - the file you are reading
  LICENSE      - LICENSE for zip32.dll and unzip32.dll	
  COPYRIGHT    - copyright
  MPL-1.1.txt  - MPL 1.1 licence
  tsqInfoZIPpkg.dpk/.cfg/.res   -- Delphi 6 component package files
  tsqZip.pas                    -- the unit where TtsqZip resides
  tsqUnZip.pas                  -- the unit where TtsqUnZip resides
  tsqZipUnZipPropertyEditor.pas -- property editors for TtsqZip and TtsqUnzip
  TtsqZip_HowTo.htm             -- Brief description on how to use TtsqZip
  TtsqUnzip_HowTo.htm           -- Brief description on how to use TtsqUnZip
  zip32.pas (modified)          -- Theodoros Bebekis <bebekis@otenet.gr>'s translation of Info-zip's zip32.dll
  unzip32.pas(modified)         -- Theodoros Bebekis <bebekis@otenet.gr>'s translation of Info-zip's unzip32.dll
  DLLCheckerUtl.pas             -- Shared procedures that were originally in zip32.pas and unzip32.pas
  Zip32.dll			-- Zip32.dll v2.3 downloaded from Info-zip
  Unzip32.dll                   -- unzip32.dll v5.5 downloaded from Info-zip

Usage
---------
Read TtsqZip_HowTo.htm and TtsqUnzip_HowTo.htm.

For the latest information of these components, please visit my webpage at 
http://free.hostdepartment.com/j/johntang/ or http://tsq.united.net.kg/. Hopefully, either of
these two sites will work.

Any bug, please send to:
 Siqing Tang, New Zealand, tsq@softhome.net
