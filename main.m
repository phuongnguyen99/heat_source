parameter;

    for caseid = 1:1
        Model;
        forward;
     for noise = [0 5 10]        
        ComputeData;
        inverse;
    end
 end
