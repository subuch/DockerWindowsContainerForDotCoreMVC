using System;
using Xunit;

namespace WinContainerCoreAppTest
{
    public class UnitTest1
    {
        [Fact(DisplayName = "AddNumberTest")]

        public void TestXUnit()
        {
            var result = 2 + 2;

            Assert.Equal(4, result);
        }
    }
}
