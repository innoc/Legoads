var fsecs = 5000;

        function feedTimer1()
        {

            if (fsecs == 0)
            {
                $('a#auto_click').trigger('click');
                fsecs =5000;
                self.status = fsecs
                ftimerRunning = true
                   ftimerID = self.setTimeout("feedTimer1()")
            }
            else
            {
                self.status = fsecs
                fsecs = fsecs - 1
                ftimerRunning = true
                ftimerID = self.setTimeout("feedTimer1()")
            }
        }

  
   window.onload = feedTimer1();