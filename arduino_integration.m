%��Arduino������ʾ��˫�����28BYJ-48��������ķ���
%����ʹ���� һ��ULN2003 �������Ʋ������.
%28BYJ-48�����������ĵ��, һ��˫�������ڵ�����pins 1 & 3�� ��һ��˫�������ڵ�����pins 2 & 4��
%���Ƕ�Ϊ 5.625/64�ȣ�����Ƶ��Ϊ100pps. ��������92������
%////////////////////////////////////////////////
 a = arduino('com5','Uno');
%ȷ��������
motorPin1 = 8;    % Blue   - 28BYJ48 pin 1
motorPin2 = 9;    % Pink   - 28BYJ48 pin 2
motorPin3 = 10;   % Yellow - 28BYJ48 pin 3
motorPin4 = 11;   % Orange - 28BYJ48 pin 4
                      % Red    - 28BYJ48 pin 5 (VCC)
 
motorspeed = 1200;  %�ܹ��趨�����ٶ�
count = 0;          % �����ۻ�����
countsperrev = 512; % һȦ�Ĳ���
lookup = [1,0,0,0;
          1,1,0,0;
          0,1,0,0;
          0,1,1,0;
          0,0,1,0;
          0,0,1,1;
          0,0,0,1;
          1,0,0,1];
    
 lookup=logical(lookup);
%//////////////////////////////////////////////////////////////////////////////
%void setup() {
%ȷ��������Ϊ���
%  pinMode(motorPin1, OUTPUT);
%  pinMode(motorPin2, OUTPUT);
%  pinMode(motorPin3, OUTPUT);
%  pinMode(motorPin4, OUTPUT);
%  Serial.begin(9600);
%}
 
%//////////////////////////////////////////////////////////////////////////////
%���³���ʹ����תһȦ��תһȦ
while(1)
  if(count < countsperrev )
    %clockwise();%˳ʱ����ת
    for i = 0:7
        %setOutput(7-i);
        writeDigitalPin(a,motorPin1, lookup(7-i,1));
        writeDigitalPin(a,motorPin2, lookup(7-i,2));
        writeDigitalPin(a,motorPin3, lookup(7-i,3));
        writeDigitalPin(a,motorPin4, lookup(7-i,4));
        %delayMicroseconds(motorSpeed);
        pause(motorspeed/1000.000);
    end
    
  elseif (count == countsperrev * 2)
    count = 0;%������תһȦ���ۻ���������
  else
    %anticlockwise();%��תһȦ��ʱ����ת
    for i = 0:8
        %setOutput(i);
        writeDigitalPin(a,motorPin1, lookup(i,1));
        writeDigitalPin(a,motorPin2, lookup(i,2));
        writeDigitalPin(a,motorPin3, lookup(i,3));
        writeDigitalPin(a,motorPin4, lookup(i,4));
        %delayMicroseconds(motorSpeed);
        pause(motorspeed/1000.000);
    end
  end
  count=count+1;
end
 