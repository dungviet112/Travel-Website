using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebDuLich.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using WebDuLich.Models.Entities;

namespace WebDuLich.Controllers.Tests
{
    [TestClass()]
    public class HomeControllerTests
    {
        
        [TestMethod()]
        public void RenderCountryTest()
        {
            var controller = new HomeController();
            var result = controller.RenderCountry() as PartialViewResult;

            Assert.IsNotNull(result);
            Assert.AreEqual("Web_Header", result.ViewName);
            Assert.IsInstanceOfType(result.Model, typeof(List<Country>));
        }

        
    }
}