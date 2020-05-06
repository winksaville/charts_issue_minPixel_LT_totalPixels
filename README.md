# charts_issue_minPixel_LT_totalPixels

Try to fix:
```
I/flutter (25091): ══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
I/flutter (25091): The following assertion was thrown during performLayout():
I/flutter (25091): 'package:charts_common/src/chart/layout/layout_config.dart': Failed assertion: line 101 pos 14:
I/flutter (25091): '_minPixel < totalPixels': is not true.
```

## To test the fix checkout 
Clone this repo recursively (charts_flutter is a submodule) and
checkout test_fix_issue_456_minPixel_LT_totalPixels:
```
wink@wink-desktop:~/prgs/flutter/projects
$ git clone --recursive git@github.com:winksaville/charts_issue_minPixel_LT_totalPixels.git -b test_fix_issue_456_minPixel_LT_totalPixels
Cloning into 'charts_issue_minPixel_LT_totalPixels'...
remote: Enumerating objects: 122, done.
remote: Counting objects: 100% (122/122), done.
remote: Compressing objects: 100% (91/91), done.
remote: Total 122 (delta 7), reused 122 (delta 7), pack-reused 0
Receiving objects: 100% (122/122), 78.08 KiB | 898.00 KiB/s, done.
Resolving deltas: 100% (7/7), done.
Submodule 'submodules/charts' (https://github.com/winksaville/charts.git) registered for path 'submodules/charts'
Cloning into '/home/wink/prgs/flutter/projects/charts_issue_minPixel_LT_totalPixels/submodules/charts'...
remote: Enumerating objects: 12, done.        
remote: Counting objects: 100% (12/12), done.        
remote: Compressing objects: 100% (11/11), done.        
remote: Total 3017 (delta 0), reused 6 (delta 0), pack-reused 3005        
Receiving objects: 100% (3017/3017), 4.86 MiB | 6.67 MiB/s, done.
Resolving deltas: 100% (1452/1452), done.
Submodule path 'submodules/charts': checked out 'aa5a50fd5fcdb4bd9b18ce9731f82a228b810420'

wink@wink-desktop:~/prgs/flutter/projects
$ cd submodules/charts/

wink@wink-desktop:~/prgs/flutter/projects/charts_issue_minPixel_LT_totalPixels (test_fix_issue_456_minPixel_LT_totalPixels)
$ flutter run -d moto
Running "flutter pub get" in charts_issue_minPixel_LT_totalPixels...         0.4s
Launching lib/main.dart on moto x4 in debug mode...
Running Gradle task 'assembleDebug'...                                  
Running Gradle task 'assembleDebug'... Done                        21.5s
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app.apk...                 5.9s
Waiting for moto x4 to report its views...                          10ms
Syncing files to device moto x4...                                 560ms

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
h Repeat this help message.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).
An Observatory debugger and profiler on moto x4 is available at: http://127.0.0.1:37217/vX_QeMsOGNs=/

Application finished.
```
## To reproduce checkout mater

Clone this repo recursively (charts_flutter is a submodule):
```
git clone --recursive https://github.com/winksaville/charts_issue_minPixel_LT_totalPixels.git
```
If you forget to use --recursive then from the root of the clone do:
```
git submodule init .
```

Connect an Android device and run the app on that device
but DO NOT login to the device, leave the screen off. If
you login and have the screen on the error does not occur:
```
$ flutter run -d moto
Launching lib/main.dart on moto x4 in debug mode...
Running Gradle task 'assembleDebug'...                                  
Running Gradle task 'assembleDebug'... Done                        32.8s
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app.apk...                 5.8s
Waiting for moto x4 to report its views...                          14ms
Syncing files to device moto x4...                                 581ms

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
h Repeat this help message.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).
An Observatory debugger and profiler on moto x4 is available at:
http://127.0.0.1:34407/7uf9Qosg75k=/

I/flutter (25091): ══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
I/flutter (25091): The following assertion was thrown during performLayout():
I/flutter (25091): 'package:charts_common/src/chart/layout/layout_config.dart': Failed assertion: line 101 pos 14:
I/flutter (25091): '_minPixel < totalPixels': is not true.
I/flutter (25091): 
I/flutter (25091): The relevant error-causing widget was:
I/flutter (25091):   ChartContainer<num>
I/flutter (25091):   file:///home/wink/prgs/flutter/projects/charts_issue_minPixel_LT_totalPixels/submodules/charts/charts_flutter/lib/src/base_chart_state.dart:89:32
I/flutter (25091): 
I/flutter (25091): When the exception was thrown, this was the stack:
I/flutter (25091): #2      MarginSpec.getMinPixels (package:charts_common/src/chart/layout/layout_config.dart:101:14)
I/flutter (25091): #3      LayoutManagerImpl._measure (package:charts_common/src/chart/layout/layout_manager_impl.dart:305:54)
I/flutter (25091): #4      LayoutManagerImpl.measure (package:charts_common/src/chart/layout/layout_manager_impl.dart:178:24)

...

I/flutter (25091): #64     SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1074:15)
I/flutter (25091): #65     SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:1013:9)
I/flutter (25091): #66     SchedulerBinding.scheduleWarmUpFrame.<anonymous closure> (package:flutter/src/scheduler/binding.dart:822:7)
I/flutter (25091): (elided 13 frames from class _AssertionError, class _RawReceivePortImpl, class _Timer, dart:async, and dart:async-patch)
I/flutter (25091): 
I/flutter (25091): The following RenderObject was being processed when the exception was fired: ChartContainerRenderObject<num>#9fa22 NEEDS-LAYOUT NEEDS-PAINT:
I/flutter (25091):   creator: ChartContainer<num> ← _PointerListener ← Listener ← _GestureSemantics ← RawGestureDetector
I/flutter (25091):     ← GestureDetector ← LayoutId-[<chartContainer>] ← CustomMultiChildLayout ← LineChart ←
I/flutter (25091):     SimpleLineChart ← Container ← _BodyBuilder ← ⋯
I/flutter (25091):   parentData: <none> (can use size)
I/flutter (25091):   constraints: BoxConstraints(w=0.0, h=0.0)
I/flutter (25091):   semantic boundary
I/flutter (25091):   size: MISSING
I/flutter (25091): This RenderObject has no descendants.
I/flutter (25091): ════════════════════════════════════════════════════════════════════════════════════════════════════
I/flutter (25091): Another exception was thrown: RenderBox was not laid out: ChartContainerRenderObject<num>#9fa22 NEEDS-PAINT
I/flutter (25091): Another exception was thrown: RenderBox was not laid out: RenderPointerListener#065db NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
I/flutter (25091): Another exception was thrown: RenderBox was not laid out: RenderSemanticsGestureHandler#9fcd2 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
I/flutter (25091): Another exception was thrown: RenderBox was not laid out: ChartContainerRenderObject<num>#9fa22

Application finished.
wink@wink-desktop:~/prgs/flutter/projects/charts_issue_minPixel_LT_totalPixels (master)
```
