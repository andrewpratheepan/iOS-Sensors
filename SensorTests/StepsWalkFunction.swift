//
//  StepsWalkFunction.swift
//  SensorTests
//
//  Created by Edward Lemaire on 2018-05-28.
//  Copyright © 2018 Edward Lemaire. All rights reserved.
//

import Foundation

class StepsWalkFunction {
    /*
    private CommonData data = CommonData.getInstance();
     private UserInfo info = UserInfo.getInstance();
    */
    
    private var DATA_SIZE = 20000; //appendable data, do you need the cap?
    var CUTOFF_FREQ_1:Float = 1;
    var CUTOFF_FREQ_4:Float = 4;
    var framespersec:Float = 50;
    var WALKWAYNUM = 60;
    var JUMPDIFF = 10;
    var TURNTIME = 3;
    var MINWALKWAYTIME = 5;
    var ROCRANGETIME = 1;
    var SLOPESIZE = 1200;
    var MAXSTEDURATIONTHESHOLD = 35;
    var LOCKINGPERIODTHRESHOLD = 20;
    var MAXSTEPS = 1000;
    var MAXSTOPS = 50;
    var MAXTOTALSTEPS = 5000;
    
    //length = DATA_SIZE : Ask if actually needed due to dynamic array nature
    var filtxlin = [Float]()
    var filtylin = [Float]()
    var filtzlin = [Float]()
    var azimuthheading = [Float]()
    var pitchheading = [Float]()
    var rollheading = [Float]()
    var intxgyro = [Float]()
    var intygyro = [Float]()
    var intzgyro = [Float]()
    
    // length = WALKWAYNUM
    var linaccelflags = [Float]()
    var avgsteptime = [Float]()
    var stepdurtime = [Float]()//LENGTH = MAXSTEPS
    
    
    //note: in order to use vars like MAXSTOPS, use lazy var, but first ask if manual inout for these constants are fine
    lazy var numstops = [[Int]](repeating: [Int](repeating: 0, count: WALKWAYNUM), count: MAXSTOPS)//double check if this is actually doing :  int[][] numstops = new int[WALKWAYNUM][MAXSTOPS];
    lazy var totalStops = [Int](repeating: 0, count: WALKWAYNUM)
    lazy var stoptime = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTOPS)
    lazy var stepdurt = [Int](repeating: 0, count: WALKWAYNUM)
    lazy var stepduration = [Int](repeating: 0, count: MAXSTEPS)
    lazy var stridecount = [Int](repeating: 0, count: WALKWAYNUM)
    
    var ltotalsteps: Int?
    var rtotalsteps: Int?
    var totalstrides: Int?
    
    lazy var maxTrange = [Float](repeating: 0, count: WALKWAYNUM)
    lazy var maxRrange = [Float](repeating: 0, count: WALKWAYNUM)
    
    lazy var maxOrange = [Float](repeating: 0, count: WALKWAYNUM)
    
    lazy var maxvert = [Float](repeating: 0, count: WALKWAYNUM)
    
    lazy var avgML = [Float](repeating: 0, count: WALKWAYNUM)
    lazy var avgvert = [Float](repeating: 0, count: WALKWAYNUM)
    
    lazy var lsteptime = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTEPS)
    lazy var rsteptime = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTEPS)
    lazy var lsteptimeind = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTEPS)
    lazy var rsteptimeind = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTEPS)
    lazy var stridetime = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: MAXSTEPS)
    
    lazy var sdvert = [Float](repeating: 0, count: WALKWAYNUM)
    lazy var sdML = [Float](repeating: 0, count: WALKWAYNUM)
    
    lazy var tiltrange = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: WALKWAYNUM)
    lazy var rollrange = [[Float]](repeating: [Float](repeating: 0, count: WALKWAYNUM), count: WALKWAYNUM)
    lazy var obliqrange = [[Float]](repeating: [Float](repeating: 0, count:WALKWAYNUM), count: WALKWAYNUM)
    
    /*
     private Rightsteps[] rightsteps = new Rightsteps[WALKWAYNUM];
     private Leftsteps[] leftsteps = new Leftsteps[WALKWAYNUM];
    */
}
