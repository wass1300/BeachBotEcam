/* 
  I2CBusMaster.h : Master code for a lightbus on Arduino
  V-0.0.1 Copytight (C) 2014 Alexis Paques
  written and in test for Arduino Duo
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

#include "Arduino.h"
#include <SPI.h>
#ifndef I2CBusMaster_h
#define I2CBusMaster_h

class I2CBusMaster
{
  public:
    I2CBusMaster();
    byte inBuffer[2];
    void Begin();
    void Send(byte adress, byte function, byte data = 0);
    void Request(byte adress); 
  private:
    inline void Flush();
};

#endif
