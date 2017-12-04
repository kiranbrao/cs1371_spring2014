function howToCircle(center,radius,angle)   
     x = linspace(0,360);
     y = x;
     plot(center(1),center(2),'*black')
     hold on
     plot(((radius.*cosd(x))+center(1)),((radius.*sind(y))+center(2)),'black')
     plot(((radius.*cosd(angle))+center(1)),((radius.*sind(angle))+center(2)),'*m')
     plot([center(1) ((radius.*cosd(angle))+center(1))], [center(2) ((radius.*sind(angle))+center(2))],'blue')
     plot([center(1) ((radius.*cosd(angle))+center(1))], [center(2) center(2)],'g--')
     plot([((radius.*cosd(angle))+center(1)) ((radius.*cosd(angle))+center(1))],[center(2) ((radius.*sind(angle))+center(2))],'c--')
     theta = linspace(0,angle,25);
     plot(((((radius.*cosd(angle))+center(1))-center(1))./3).*cosd(theta)+center(1),((((radius.*cosd(angle))+center(1))-center(1))./3).*sind(theta)+center(2),'--r')
     roundedPoint = [(round(((radius.*cosd(angle))+center(1)).*100)./100) (round(((radius.*sind(angle))+center(2)).*100)./100)];
     legend(sprintf('center of circle: (%g,%g)',center(1),center(2)),'circle perimeter',sprintf('(%g,%g)',roundedPoint(1),roundedPoint(2)),sprintf('radius = %g',radius),'r*cos(th)','r*sin(th)',sprintf('th = %g degrees',angle), 'Location','SouthEast')
     title('How to Circle')   
     axis equal
     hold off
end

     