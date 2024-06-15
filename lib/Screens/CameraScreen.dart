import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/Screens/CameraView.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 4),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      InkWell(
                        onTap: () {
                          takePhoto(context);
                        },
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text("Hold for Video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    try {
      // Take the picture and get the file.
      final XFile picture = await _cameraController.takePicture();

      // Get the temporary directory.
      final directory = await getTemporaryDirectory();

      // Create a new file path for the image.
      final path = join(directory.path, "${DateTime.now()}.png");

      // Move the picture to the new path.
      await picture.saveTo(path);

      print('Picture saved to $path');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CameraViewPage(path: path,)));
    } catch (e) {
      print('Error taking picture: $e');
    }
  }
}
