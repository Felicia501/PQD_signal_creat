% filename:signal_creat.m
% author:gdx_2019.11.30
% function: input signal_samp's frequenpy, get 8types signal mat
function [signal] = signal_creat(frequeny)

%�����������ã�����Ƶ��
w=2*pi/0.02; %����Ƶ��Ϊ50Hz
A=1; %�źŷ�ֵ
f=frequeny; %Hz,����Ƶ�ʣ�����������0.2s,ÿ�����5000�Σ�0.2��Ҳ����1000��������
TimeInterval=0:1/f:((f/5)/f);%����10��������������Ҫ�Ĳ�������
t=TimeInterval;
%1�����ź�
z=A*sin(w*t);
z1=[z,0];
%2��ѹ�ݽ�
T21=(1+7*rand())*0.02;  %t2-t1,�Ŷ���ʼ�ͽ�����ʱ���,1-8T֮��
t1=rand()*0.02*8+0.02;  %�Ŷ���ʼʱ�䣬��ʼ�ź���������ڵ�9������ 
t2=t1+T21; %�Ŷ�����ʱ��
Aerfa=(1+8*rand())*0.1; %�ݽ���ֵΪ0.1-0.9֮��
z=zeros(1,length(t));
for j=1:length(t)
    U1=0;U2=0;%UΪ��Ծ������U1=u(t-t1)\U2=u(t-t2)
    if t(j)>t1
       U1=1;
    else
       U1=0;
    end
    if t(j)>t2
       U2=1;
    else
       U2=0;
    end
    z(j)=A*(1-Aerfa*(U1-U2))*sin(w*t(j)); 
end
z2=[z,1];
%3��ѹ����
T21=(1+7*rand())*0.02;  %t2-t1,�Ŷ���ʼ�ͽ�����ʱ���,1-8T֮��
t1=rand()*0.02*8+0.02;  %�Ŷ���ʼʱ�䣬��ʼ�ź���������ڵ�9������ 
t2=t1+T21; %�Ŷ�����ʱ��
Aerfa=(1+7*rand())*0.1; %������ֵΪ0.1-0.8֮��
z=zeros(1,length(t));
for j=1:length(t)
    U1=0;U2=0;%UΪ��Ծ������U1=u(t-t1)\U2=u(t-t2)
    if t(j)>t1
       U1=1;
    else
       U1=0;
    end
    if t(j)>t2
       U2=1;
    else
       U2=0;
    end
    z(j)=A*(1+Aerfa*(U1-U2))*sin(w*t(j)); 
end
z3=[z,2];
%4��ѹ�ж�
T21=(1+7*rand())*0.02;  %t2-t1,�Ŷ���ʼ�ͽ�����ʱ���,1-8T֮��
t1=rand()*0.02*8+0.02;  %�Ŷ���ʼʱ�䣬��ʼ�ź���������ڵ�9������ 
t2=t1+T21; %�Ŷ�����ʱ��
Aerfa=0.9+rand()*0.1; %���ͷ�ֵΪ0.9-1֮��
z=zeros(1,length(t));
for j=1:length(t)
    U1=0;U2=0;%UΪ��Ծ������U1=u(t-t1)\U2=u(t-t2)
    if t(j)>t1
       U1=1;
    else
       U1=0;
    end
    if t(j)>t2
       U2=1;
    else
       U2=0;
    end
    z(j)=A*(1-Aerfa*(U1-U2))*sin(w*t(j)); 
end
z4=[z,3];
%5г��
Aerfa3=rand()*0.98+0.02;%г����ֵΪ0.02-1
Aerfa5=rand()*0.98+0.02;
Aerfa7=rand()*0.98+0.02;
Aerfa11=rand()*0.98+0.02;%�ݲ�����13������г��
z=A*sin(w*t)+Aerfa3*sin(3*w*t)+Aerfa5*sin(5*w*t)+Aerfa7*sin(7*w*t)+Aerfa11*sin(11*w*t);
z5=[z,4];
%6��ѹ����
Aerfa=rand()*0.1+0.1; %��������0.1-0.2
Beita=rand()*0.4+0.1; %����Ƶ�����ϵ��0.1-0.5
z=A*(1+Aerfa*sin(Beita*w*t)).*sin(w*t);
z6=[z,5];
%7����
T21=(0.02/20)*(1+2*rand());  %������t2-t1Ϊ1-3ms
t1=rand()*0.02*8+0.02;  %�Ŷ���ʼʱ�䣬��ʼ�ź���������ڵ�9������
t2=t1+T21;
Aerfa=rand()*2+1;%�����ֵΪ1-3
z=zeros(1,length(t));
for j=1:length(t)
    U1=0;U2=0;
    if t(j)>t1
       U1=1;
    else
       U1=0;
    end
    if t(j)>t2
       U2=1;
    else
       U2=0;
    end
    z(j)=A*(1+Aerfa*(U1-U2))*sin(w*t(j)); 
end
z7=[z,6];
%8��
Aerfa=0.1+rand()*0.7; %�������ȣ�0.1-0.8
c=0.1+rand()*0.7; %��˥��ϵ��0.1-0.8
Beita=rand()*6+10; %��Ƶ�����ϵ��10-16
T21=(0.5+2.5*rand())*0.02;  %t2-t1,�Ŷ���ʼ�ͽ�����ʱ���,0.5-3T֮��
t1=rand()*0.02*8+0.02;  %�Ŷ���ʼʱ�䣬��ʼ�ź���������ڵ�9������ 
t2=t1+T21; %�Ŷ�����ʱ��
z=zeros(1,length(t));
for j=1:length(t)
    U1=0;U2=0;
    if t(j)>t1
       U1=1;
    else
       U1=0;
    end
    if t(j)>t2
       U2=1;
    else
       U2=0;
    end
    z(j)=Aerfa*exp(-c*(t(j)-t1))*(U1-U2)*sin(Beita*w*t(j))+sin(w*t(j)); 
end
z8=[z,7];
signal=[z1;z2;z3;z4;z5;z6;z7;z8];