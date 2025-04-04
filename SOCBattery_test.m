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
        function verify(testCase)
                testCase.verifyEqual(testCase.resultSet.NumPassed,4);
        end
    end
        
end
