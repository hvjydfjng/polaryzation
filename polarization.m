clc
clear
clf
c=3*10^8
l=0.0
l=input('введите длину волны, нм ')
d=input('введите разность фаз ')
otna=input('введите отношение амплитуд ')
l1=l
if((l>=380) && (l<=440))
    cv=' фиолетовый'
    
end
if((l>440) && (l<=485))
    cv=' синий'
end
if((l>485) && (l<=500))
cv=' голубой'
end
if((l>500) && (l<=565))
    cv=' зелёный'
end
if((l>565) && (l<=590))
    cv=' жёлтый'
end
if((l>590) && (l<=625))
    cv=' оранжевый'
end
if((l>625) && (l<=740))
    cv=' красный'
end
l=l*10^-9;
    v=c/l;
w=2*pi*v;
a01=1*10^-6;
a02=(a01)/otna;
T=2*pi/w;
otna=a01/a02
l1=num2str(l1)
d1=num2str(d)
otna=num2str(otna)
l1=strcat(' ',l1,' ')
disp(strcat('свет сейчас: ',cv,'; длина волны: ',' ',l1,' ',' нм;', ' разность фаз: ',' ',d1,' ','; отношение амплитуд: ',' ',otna)) 
    figure(1);
grid on
for t=0:.0000000000000001:0.00000000000001
x=0:0.00000001:0.000004;
grid on
y=a01*cos(w*t-2*pi/l*x);
z=0*x+0;
plot3(x,y,z);
hold on
quiver3(4*10^-6,0,0,-5*10^-6,0,0,'k');%z
quiver3(4*10^-6,0,0,0,-a01-0.1*10^-6,0,'k');%x
quiver3(4*10^-6,0,0,0,0,a02+0.1*10^-6,'k');%y
text(4*10^-6,-a01-0.1*10^-6,0,'x');
text(4*10^-6,0,a02+0.1*10^-6,'y');
text(-0.1*10^-6,0,-0.1*10^-6,'z');
hold on
grid on
z=a02*cos(w*t-2*pi/l*x+d);
y=0*x;
plot3(x,y,z,'r');
xlabel('x');
ylabel('y');
zlabel('z');
pause(0.00001);
grid on
hold off
grid on
end
c=1;
figure(2);
for t=0:.0000000000000001:0.00000000000001
x=0:0.00000001:0.000004;
grid on
y=a01*cos(w*t-2*pi/l*x);
z=a02*cos(w*t-2*pi/l*x+d);
plot3(x,y,z,'g');
grid on
hold on
figure(2);
quiver3(0,0,0,0,y(1),z(1),'r');
quiver3(4*10^-6,0,0,-5*10^-6,0,0,'k');%z
quiver3(4*10^-6,0,0,0,-a01-0.1*10^-6,0,'k');%x
quiver3(4*10^-6,0,0,0,0,a02+0.1*10^-6,'k');%y
quiver3(0,0,0,0,y(1),0,'c');
quiver3(0,0,0,0,0,z(1),'m');
text(4*10^-6,-a01-0.1*10^-6,0,'x');
text(4*10^-6,0,a02+0.1*10^-6,'y');
text(-0.1*10^-6,0,-0.1*10^-6,'z');
grid on
hold off
pause(0.1);
c=c+1;
end
figure(3);
c=1;
for t=0:.0000000000000001:0.00000000000001
x=0:0.00000001:0.000004;
grid on
y=a01*cos(w*t-2*pi/l*x);
z=a02*cos(w*t-2*pi/l*x+d);
plot(y,z);
grid on
hold on
quiver(0,0,y(1),z(1),'r','LineWidth',2);
quiver(0,0,a01,0,'k');
quiver(0,0,0,a02,'k');
quiver(0,0,y(1),0,'c');
quiver(0,0,0,z(1),'m');
text(0,-0.1*10^-6,'O')
text(0.9*10^-6,-0.1*10^-6,'x')
text(0.1*10^-6,0.9*10^-6,'y')
pause(0.1);

hold off;
c=c+1;
end
