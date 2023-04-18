/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String animation_state = 'Walk';
  late var _controller;
  void changeAnimation(String changeName) {
    setState(() {
      animation_state = changeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Model Viewer")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: ModelViewer(
                      key: ValueKey(animation_state),
                      animationCrossfadeDuration: 0,
                      backgroundColor: Colors.black,
                      src:
                          'lib/assets/Sparrow_Animations.glb', // a bundled asset file
                      alt: "A 3D model of an astronaut",
                      ar: false,
                      arModes: ['scene-viewer', 'webxr', 'quick-look'],

                      autoRotate: false,
                      cameraControls: true,
                      fieldOfView: "30deg",
                      // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                      disableZoom: false,
                      animationName: animation_state,
                      autoPlay: true,
                      onWebViewCreated: (controller) => {
                        _controller = controller, //Set the controller up
                      },
                      relatedJs: """
    function setAnimationName(animation) {
      const modelViewer = document.querySelector('#<ID>');
      modelViewer.animationName = animation;
    }""",
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    child: ModelViewer(
                      key: ValueKey(animation_state),
                      animationCrossfadeDuration: 0,
                      backgroundColor: Colors.white,
                      src:
                          'lib/assets/Sparrow_Animations.glb', // a bundled asset file
                      alt: "A 3D model of an astronaut",
                      ar: false,
                      arModes: ['scene-viewer', 'webxr', 'quick-look'],

                      autoRotate: false,
                      cameraControls: true,
                      fieldOfView: "30deg",
                      // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                      disableZoom: false,
                      animationName: animation_state,
                      autoPlay: true,
                      onWebViewCreated: (controller) => {
                        _controller = controller, //Set the controller up
                      },
                      relatedJs: """
    function setAnimationName(animation) {
      const modelViewer = document.querySelector('#<ID>');
      modelViewer.animationName = animation;
    }""",
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    child: ModelViewer(
                      key: ValueKey(animation_state),
                      animationCrossfadeDuration: 0,
                      src:
                          'lib/assets/Sparrow_Animations.glb', // a bundled asset file
                      alt: "A 3D model of an astronaut",
                      ar: false,
                      arModes: ['scene-viewer', 'webxr', 'quick-look'],

                      autoRotate: false,
                      cameraControls: true,
                      fieldOfView: "30deg",
                      // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                      disableZoom: false,
                      animationName: animation_state,
                      autoPlay: true,
                      onWebViewCreated: (controller) => {
                        _controller = controller, //Set the controller up
                      },
                      relatedJs: """
    function setAnimationName(animation) {
      const modelViewer = document.querySelector('#<ID>');
      modelViewer.animationName = animation;
    }""",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      changeAnimation('Walk');
                    },
                    child: Text(
                      'Walk',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        animation_state = 'Run';
                      });
                    },
                    child: Text(
                      'Run',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        changeAnimation('Sit');
                      });
                      print(animation_state);
                    },
                    child: Text(
                      'Sit',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        changeAnimation('Jump');
                      });
                    },
                    child: Text(
                      'Jump',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        changeAnimation('Roll');
                      });
                    },
                    child: Text(
                      'Roll',
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
