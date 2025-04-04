classdef SOCBattery_test < matlab.unittest.TestCase
    % SOCBattery_test
    % Bu sınıf, BatterySOCSysIntTest dosyasında bulunan ilk 4 testin
    % geçtiğini doğrulamaya yarar.

    properties (Access = private)
        testResults  % BatterySOCSysIntTest çıktısındaki tüm TestResult nesneleri
    end

    methods (TestClassSetup)
        function runBatterySOCTestSuite(testCase)
            % BatterySOCSysIntTest test dosyasını çalıştırıp sonuçlarını kaydetmek
            import matlab.unittest.TestRunner
            
            % Önce test suite'ini oluşturmayı deneyin. Dosya yoksa veya hata varsa yakalayın.
            try
                suite = testsuite("BatterySOCSysIntTest");
            catch ME
                testCase.fatalAssertFail(sprintf("BatterySOCSysIntTest dosyası bulunamadı veya oluşturulamadı:\n%s", ME.message));
            end
            
            % Plugin'siz basit bir TestRunner oluşturun
            runner = TestRunner.withNoPlugins;
            
            % Suite'i bir kez çalıştırın
            results = run(runner, suite);
            
            % Test sayısı kontrolü: En az 4 adet test bekliyoruz
            testCase.assertGreaterThanOrEqual(numel(results), 4, ...
                sprintf(['BatterySOCSysIntTest içinde en az 4 test olduğu varsayılıyor,\n' ...
                         'ancak yalnızca %d test bulundu.'], numel(results)));
            
            % Sonuçları saklayın
            testCase.testResults = results;
        end
    end

    methods (Test)
        function verify_1(testCase)
            % 1. testi kontrol et
            res = testCase.testResults(1);
            testCase.verifyTrue(res.Passed, ...
                sprintf(['1. test başarısız oldu.\n' ...
                         'Test Adı: %s\n' ...
                         'Detay: %s'], res.Name, localGetFailureDetails(res)));
        end

        function verify_2(testCase)
            % 2. testi kontrol et
            res = testCase.testResults(2);
            testCase.verifyTrue(res.Passed, ...
                sprintf(['2. test başarısız oldu.\n' ...
                         'Test Adı: %s\n' ...
                         'Detay: %s'], res.Name, localGetFailureDetails(res)));
        end

        function verify_3(testCase)
            % 3. testi kontrol et
            res = testCase.testResults(3);
            testCase.verifyTrue(res.Passed, ...
                sprintf(['3. test başarısız oldu.\n' ...
                         'Test Adı: %s\n' ...
                         'Detay: %s'], res.Name, localGetFailureDetails(res)));
        end

        function verify_4(testCase)
            % 4. testi kontrol et
            res = testCase.testResults(4);
            testCase.verifyTrue(res.Passed, ...
                sprintf(['4. test başarısız oldu.\n' ...
                         'Test Adı: %s\n' ...
                         'Detay: %s'], res.Name, localGetFailureDetails(res)));
        end
    end
end

%% Yerel yardımcı fonksiyon
function detailMsg = localGetFailureDetails(testResult)
    % TestResult nesnesi içinde ek hata/ayrıntı varsa döndür, yoksa boş bırak.
    if isfield(testResult.Details, 'DiagnosticRecord') && ~isempty(testResult.Details.DiagnosticRecord)
        % DiagnosticRecord bazen çok detaylı olabilir; burada basitçe mesaj alıyoruz.
        detailMsg = testResult.Details.DiagnosticRecord.Report;
    else
        detailMsg = 'Detaylı bilgi mevcut değil.';
    end
end
