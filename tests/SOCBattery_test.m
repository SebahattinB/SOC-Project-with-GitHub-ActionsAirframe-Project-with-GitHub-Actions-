classdef SOCBattery_test < matlab.unittest.TestCase
    properties (Access = private)
        testResults
    end
    
    methods(TestClassSetup)
        function runBatterySOCTestSuite(testCase)
            % Import the runner
            import matlab.unittest.TestRunner
            
            % Create the suite from your test file or folder
            suite = testsuite("BatterySOCSysIntTest");
            
            % Create a runner with no plugins
            runner = TestRunner.withNoPlugins;
            
            % Run once, store the results for use in all test methods
            testCase.testResults = run(runner, suite);
        end
    end
    
    methods(Test)
        function verify_1(testCase)
            % Check that the 1st test in BatterySOCSysIntTest passed
            testCase.verifyTrue(testCase.testResults(1).Passed, ...
                'The 1st test in BatterySOCSysIntTest failed.');
        end
        
        function verify_2(testCase)
            % Check that the 2nd test in BatterySOCSysIntTest passed
            testCase.verifyTrue(testCase.testResults(2).Passed, ...
                'The 2nd test in BatterySOCSysIntTest failed.');
        end
        
        function verify_3(testCase)
            % Check that the 3rd test in BatterySOCSysIntTest passed
            testCase.verifyTrue(testCase.testResults(3).Passed, ...
                'The 3rd test in BatterySOCSysIntTest failed.');
        end
        
        function verify_4(testCase)
            % Check that the 4th test in BatterySOCSysIntTest passed
            testCase.verifyTrue(testCase.testResults(4).Passed, ...
                'The 4th test in BatterySOCSysIntTest failed.');
        end
    end
end
