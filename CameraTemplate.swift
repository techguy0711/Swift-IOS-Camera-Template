 var captureSession: AVCaptureSession?
 var videoPreviewLayer: AVCaptureVideoPreviewLayer?
 let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
 override func viewDidLoad() {
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    super.viewDidLoad()
    do {
        let input = try AVCaptureDeviceInput(device: self.captureDevice!)
        captureSession = AVCaptureSession()
        captureSession?.addInput(input)
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        cameraView.layer.addSublayer(videoPreviewLayer!)
        camera View.insertSubview(iconView, at: 1) //brings icon view foreward
        captureSession?.startRunning()
    } catch {
        print(error)
    }
    //***************AUTO FOCUS STUFF***************
    if(captureDevice!.isFocusModeSupported(.continuousAutoFocus)) {
        try! captureDevice!.lockForConfiguration()
        captureDevice!.focusMode = .continuousAutoFocus
        captureDevice!.unlockForConfiguration()
 }
 
 //***************AUTO FOCUS STUFF***************
 
