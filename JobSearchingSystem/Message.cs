//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobSearchingSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        public Message()
        {
            this.MessageReceivers = new HashSet<MessageReceiver>();
        }
    
        public int MessageID { get; set; }
        public string SenderID { get; set; }
        public string Message_content { get; set; }
        public System.DateTime SendTime { get; set; }
        public bool IsDeletedBySender { get; set; }
        public bool IsCanceled { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual ICollection<MessageReceiver> MessageReceivers { get; set; }
    }
}
