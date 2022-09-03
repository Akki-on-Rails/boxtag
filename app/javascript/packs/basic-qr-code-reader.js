import { BrowserQRCodeReader } from '@zxing/library';

const codeReader = new BrowserQRCodeReader();

codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    // process the result

    document.getElementById('beep-audio').play()
    return result


  }).then((result) => {
    console.log(result.text)
    document.getElementById('result').textContent = result.text
    window.location.replace(result.text)

  })
  .catch(err => console.error(err));
