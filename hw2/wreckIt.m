function[logical] = wreckIt(force,hits,building)
    logical = force.*hits >= building; %this line states that if the number of hits times the force of each hit is greater than or equal to the critical load of the building, the funciton will output true, meaning Ralph destroys the building
   end
    