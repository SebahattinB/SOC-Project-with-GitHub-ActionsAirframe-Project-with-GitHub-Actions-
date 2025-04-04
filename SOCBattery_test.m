classdef SOCBattery_test < matlab.unittest.TestCase
    
    properties (Access = private)
        resultSet    % sltest.testmanager.run çıktısı (ResultSet nesnesi)
        fileResults  % getTestFileResults(resultSet) sonucu
        suiteResults % getTestSuiteResults(fileResults) sonucu
        caseResults  % getTestCaseResults(suiteResults) sonucu
    end
    
    methods(TestClassSetup)
        function runBatterySOCTestSuite(testCase)
            
            % 1) .mldatx dosyasını yükleyin
            sltest.testmanager.load("BatterySOCSysIntTest.mldatx");
            
            % 2) Tüm testleri çalıştırın ve sonuçları saklayın
            testCase.resultSet = sltest.testmanager.run();
            
            % 3) Sonuçları hiyerarşik olarak çekin
            testCase.fileResults  = getTestFileResults(testCase.resultSet);
            testCase.suiteResults = getTestSuiteResults(testCase.fileResults);
            testCase.caseResults  = getTestCaseResults(testCase.suiteResults);
        end
    end
    
    methods(Test)
        function verify_1(testCase)
            import sltest.testmanager.TestResultOutcomes
            testCase.verifyEqual( ...
                testCase.caseResults(1).Outcome, ...
                TestResultOutcomes.Passed, ...
                'Test 1 başarısız oldu!' ...
            );
        end
        
        function verify_2(testCase)
            import sltest.testmanager.TestResultOutcomes
            testCase.verifyEqual( ...
                testCase.caseResults(2).Outcome, ...
                TestResultOutcomes.Passed, ...
                'Test 2 başarısız oldu!' ...
            );
        end
        
        function verify_3(testCase)
            import sltest.testmanager.TestResultOutcomes
            testCase.verifyEqual( ...
                testCase.caseResults(3).Outcome, ...
                TestResultOutcomes.Passed, ...
                'Test 3 başarısız oldu!' ...
            );
        end
        
        function verify_4(testCase)
            import sltest.testmanager.TestResultOutcomes
            testCase.verifyEqual( ...
                testCase.caseResults(4).Outcome, ...
                TestResultOutcomes.Passed, ...
                'Test 4 başarısız oldu!' ...
            );
        end
    end
end
