﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Utils
    {
        static public string baseUrl()
        {
            return string.Format("{0}://{1}{2}",
            HttpContext.Current.Request.Url.Scheme,
            HttpContext.Current.Request.ServerVariables["HTTP_HOST"],
            (HttpContext.Current.Request.ApplicationPath.Equals("/")) ? string.Empty : HttpContext.Current.Request.ApplicationPath
            );
        }
    }
