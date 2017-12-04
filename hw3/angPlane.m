function[angle] = angPlane(coord1,coord2,coordPort)
    vect1 = coord1-coordPort; %this line calculates the vector for the first plane
    vect2 = coord2 - coordPort; %this line calculates the vector for the second plane
    angleUnrounded = acosd((dot(vect1,vect2))./(norm(vect1).*norm(vect2))); %this line calculates the dot products, magnitudes, and arccosine of the angle between the planes
    angle = round(angleUnrounded.*10)./10;
end
