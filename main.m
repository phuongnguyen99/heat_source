parameter;

    for caseid = 1:4
        Model;
        forward;
     for noise = [0 5 10]        
        ComputeData;
        inverse;
    end
 end
