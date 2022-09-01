import { BrowserQRCodeReader } from '@zxing/browser';

try {
  const codeReader = new BrowserQRCodeReader();

codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    // process the result
    console.log(result.text)

    document.getElementById('result').textContent = result.text
    window.location.replace(result.text)
  })
  .catch(err => console.error(err));

} catch (error) {
  throw "Not supported";
}
