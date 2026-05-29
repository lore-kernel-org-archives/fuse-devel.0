Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1D3CFF72
	for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053318; cv=none; b=ejexhWRksD0J1tTK3ncI0Dvq5EgmLmvtIuAVHJR1RfR93IEm5fOonx9Ex+PGcULH/filMTMwRpDMEynVZmWKHqJdGrsV9IJGVZkS/VxR2S7s/YNWCkjtF6ubojN4diI6f6+ZU67kj/F3AZcQaQectzu3nqFUk1T+8zpgoYk6huE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053318; c=relaxed/simple;
	bh=aJoJ8z8P6XEfkAsEia++zc2raq9XOiX8G8iNXjhG5So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MP5Sb1U5Pms6H/W6OmKdEErB2VBsFt+1iu+wkIA+48wvhBQ8lFevFUyWIuJxVtQpu6bL5/TAaigIkbKz+ESgpERinzzwt25+ox+BFy6XfqNco1sgpbZM7UzxuVtNqDUuUYwbzPeB3rS0HgST+mZiYJAQMrs39Dvu3A+a2H/9bLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=eIZPUPfg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CHrDQgNN; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="eIZPUPfg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CHrDQgNN"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E1AFF14000A7;
	Fri, 29 May 2026 07:15:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 29 May 2026 07:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1780053315;
	 x=1780139715; bh=5D0HtU+EpN5rFRr3UvUObtdHs2E0jUF8xutgZpWKfbk=; b=
	eIZPUPfgVhr/rKCtS9QE/sG9a29CIStKl5QJXsmzcDDbNaQbp+l3hgawvWIoYwbd
	WgzldVBeJg/sWmmfN/qMzpnbXt6o2mwytNjUg1w8WiMDSm/fBRSCQ4cUMwg0KPBt
	JDItUwDG3NoJJz4ZPopv8mI6CCN4Mpgl6iiJQ+JKIh+ZhJCwSr7UciOSmsu545pp
	SFw+mFcRsHh2kHwFl1nrmRmrHIfY1HONVRkDtiQGPzHe4KVcP4LUpVJ3DPYWsk4l
	2pUrCayobM0mNXnV46uI7ydNcOYOBz03SMhj6KXR/dEri0eiWs3rM2nu8pStMDX7
	HGTqxjwFrs6dbEM/vheEOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780053315; x=
	1780139715; bh=5D0HtU+EpN5rFRr3UvUObtdHs2E0jUF8xutgZpWKfbk=; b=C
	HrDQgNNCExt9JrPk6e6YE6pfeam/q5+Vwxb3Veke4sRcAJ0whLQ9Fbhjf1AIbRBx
	zHHQH0Nng2b5793FgY2P2JYaOzRM/4LqlFhbAc5HYNCoHnd2hx2/2kLSotgmhjPc
	FOMnE3cIRUaWL5ZQ9TqF4TwTA5vTIND84N4krOH3HVDMXqS5PR+BB4ZqNQ7+dHYv
	D1WMoB2Phv/sGVuysL+MbcJ09v2JdOjRbT5UjgRa8neHoB9JZpddMTgxAcVhldPZ
	JlDG+1LFWuF+pe2+DY7H1b57nOQGkjMdQZoJln2d5kSWhZ8Bu68CG1eYI/Ztb127
	rPWISyPyOFEOATrzQDkVw==
X-ME-Sender: <xms:Q3UZarPeysihfpK_wTPn9ZYZ_0SdI6_tnSXM7VtNhj9LDoeX4L8DRQ>
    <xme:Q3UZas2KpmQd3roqYo6wrx6ZiJYQXBjokd1FwnlG7la-09vT6Qy-30-F6XbdzJuba
    X30zm_1j7GSTcQPpENcogiZeN-r426JI3iRQT0rFNurX5Jl_7y47g>
X-ME-Received: <xmr:Q3UZainaq9ktgzoj6RS4L4vGzuazj4Id7rit7IcPO4tF6GwsyvqEQSs8tRmHmG-dJiqsm3PYhGW8SqZFozArmEFMQyakWCZrCG8-ZsD6fddkW1f5Fg>
X-ME-Proxy-Cause: dmFkZTEc0eI00Sh9raV0ZUnLo1C2YV3STN6Dp/r1uqlozIl+6p91XAAqBPy1yeEw2b/D40
    4PCBP6PEf1jpuE375+H4sMXwLaWXv63H8K+LcFY2ndb8tJ37xmyaWBsTGWQCPVlawbgnWc
    KgF1GN3iwIAUuVkmBOKnikUK+OpsSKB9MzVxeBUXb6aiyixrflLD/FJVZxR1eQV/H60EIu
    uzaaRtAL/y31YeKMizoMtmXEXL2Rhau0eW4LVosdsJS+6V+ciLxZ2D82DZUUX40LcJ9wmf
    Zbc7hpoj4WIVAoH+PcildGg2efPachjMebe5Xv4HKah7u5FAaD59oOesDFqIcvnVWTt7BK
    5OluXqlK1lx5SfgSk2ataMbYwQLfYSG0gBeq+bB2vDMJOWX/8GmaiUWLBzU9mGicCQqtPY
    6Os2hFjwLhjN6aFAKxElFYYmOWKAyFxSa1IS2naP++RNL+MPFZXoXVKlL/RjpwzH/gA+zK
    uierefRH2ittuOiBFDJ2PEyDCEfMOD++k7rPlVCVUKS3Fz5ZFLneO2u+vMiU3slDsJYbYm
    KT1J1+CCXTJmMzCV7VXso+/DwNaQg1aGuvVjHzJ1jIk3MjkxgoN42Cu6yT64FdOTR0iU+d
    KDl2EwANZeORjqwIyKOh80nHatbIq95aLuyvzFl7jvupB06vkr3TUDRhw9xA
X-ME-Proxy: <xmx:Q3UZarXjmUWkJzZvBFESoE5EzVJpreatxneFvIdhNe8Pqfvq2A4Lsw>
    <xmx:Q3UZagtPDPsK2VvqFUZA0GQV3DBTZS3A0FoqG4GBG8O5hi2OdKT2Yg>
    <xmx:Q3UZambjYV-uN6AVfVjlYJl2l8GlDCTgz9qoHXKfEaFdfTUYbw-AzA>
    <xmx:Q3UZanW-PPv7JPndb6aGulaLHRu4mZJqP1Q1qwLrqu6U7IFCKVqg3A>
    <xmx:Q3UZarWss1v9IwxvyZ5-l5xWgbbKTmRIWuqkxJdupYg7sRq_xjq2GOln>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 May 2026 07:15:14 -0400 (EDT)
Message-ID: <d489efeb-000a-4c15-9bd2-3a1b253a0202@fastmail.fm>
Date: Fri, 29 May 2026 13:15:13 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong
 <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>,
 fuse-devel@lists.linux.dev
References: <20260527171808.828637-1-amir73il@gmail.com>
 <92906aae-a3eb-4ea4-adad-7289045fdbff@fastmail.fm>
 <CAOQ4uxiNZPA7SiCf_nkJFa_9HZetJGDn_REoihRTX9ePYpqMmg@mail.gmail.com>
From: Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAOQ4uxiNZPA7SiCf_nkJFa_9HZetJGDn_REoihRTX9ePYpqMmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/29/26 12:37, Amir Goldstein wrote:
> On Fri, May 29, 2026 at 1:01 AM Bernd Schubert
> <bernd.schubert@fastmail.fm> wrote:
>>
>>
>>
>> On 5/27/26 19:18, Amir Goldstein wrote:
>>> This new tracepoint complements the existing fuse_request_send (enqueue)
>>> and fuse_request_end (completion) with a tracepoint at the transition
>>> from "pending" to "in-progress" at the moment a daemon thread dequeues
>>> a request from fiq->pending.
>>>
>>> This is needed for tools tracking the in-flight state of fuse requests.
>>>
>>> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
>>> ---
>>>
>>> Miklos,
>>>
>>> This patch is not technically a fix patch, but it complements the
>>> tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
>>> simple request tracepoints"), so it is my intention to backport it up to
>>> 6.12.y for use on production kernels.
>>>
>>> I came across the need for this tracepoint when working on fuse queue
>>> monitoring tools [1] for our production env.
>>>
>>> The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
>>> post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id of
>>> fuse commands being sent").  Not sure why it was not tagged as Fixes.
>>> The existence of fuse_request_recv
>>>
>>> This patch is intentionally based on upstream fuse (v7.1-rc2) and not
>>> on for-next branch, with ease of backport in mind.
>>>
>>> Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan")
>>> on for-next needs to apply the same change to the new tracepoint as well.
>>>
>>> Would you consider applying this patch at the bottom of for-next and
>>> make this adjustment to your refactoring commit?
>>>
>>> Thanks,
>>> Amir.
>>>
>>> [1] https://github.com/amir73il/bcc/commits/fuseq/
>>>
>>>  fs/fuse/dev.c        |  1 +
>>>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
>>>  2 files changed, 23 insertions(+)
>>>
>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>> index 5dda7080f4a90..583155157d117 100644
>>> --- a/fs/fuse/dev.c
>>> +++ b/fs/fuse/dev.c
>>> @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
>>>       req = list_entry(fiq->pending.next, struct fuse_req, list);
>>>       clear_bit(FR_PENDING, &req->flags);
>>>       list_del_init(&req->list);
>>> +     trace_fuse_request_recv(req);
>>>       spin_unlock(&fiq->lock);
>>>
>>>       args = req->args;
>>> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
>>> index bbe9ddd8c7169..289a279b3c312 100644
>>> --- a/fs/fuse/fuse_trace.h
>>> +++ b/fs/fuse/fuse_trace.h
>>> @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
>>>                 __print_symbolic(__entry->opcode, OPCODES), __entry->len)
>>>  );
>>>
>>> +TRACE_EVENT(fuse_request_recv,
>>> +     TP_PROTO(const struct fuse_req *req),
>>> +
>>> +     TP_ARGS(req),
>>> +
>>> +     TP_STRUCT__entry(
>>> +             __field(dev_t,                  connection)
>>> +             __field(uint64_t,               unique)
>>> +             __field(enum fuse_opcode,       opcode)
>>> +     ),
>>> +
>>> +     TP_fast_assign(
>>> +             __entry->connection     =       req->fm->fc->dev;
>>> +             __entry->unique         =       req->in.h.unique;
>>> +             __entry->opcode         =       req->in.h.opcode;
>>> +     ),
>>> +
>>> +     TP_printk("connection %u req %llu opcode %u (%s)",
>>> +               __entry->connection, __entry->unique, __entry->opcode,
>>> +               __print_symbolic(__entry->opcode, OPCODES))
>>> +);
>>> +
>>>  TRACE_EVENT(fuse_request_end,
>>>       TP_PROTO(const struct fuse_req *req),
>>>
>>
>> I find the name 'fuse_request_recv' a bit confusing. Why not
>> 'fuse_request_read'?
> 
> Well, to balance fuse_request_send of course ;)
> 
> I'll note that _read() is not adequate for iouring, which bares the question,
> should we also add a tracepoint at iouring dispatch:
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 7b9822e8837bc..97cb990bf9de3 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -702,10 +702,12 @@ static int fuse_uring_prepare_send(struct
> fuse_ring_ent *ent,
>         int err;
> 
>         err = fuse_uring_copy_to_ring(ent, req);
> -       if (!err)
> +       if (!err) {
>                 set_bit(FR_SENT, &req->flags);
> -       else
> +               trace_fuse_request_recv(req);
> +       } else {
>                 fuse_uring_req_end(ent, req, err);
> +       }
> 
>         return err;
>  }
> 
> Not sure which pid will be traced here? the libfuse queue worker thread pid?
> Is that meaningful to someone?
> 
> Another option for a tracepoint name, looking at the above would be
> trace_fuse_request_sent()
> 
> But I would not change the name until anyone insists.
> 

So the sad part is that I had done all of that

https://lore.kernel.org/all/20250403-fuse-io-uring-trace-points-v3-4-35340aa31d9c@ddn.com/

However, I had noticed that we take the fiq lock just to increase the
request unique, changed it to an atomic and then Miklos asked to change
it to a per CPU counter. That got complex with per-cpu, the updated
series had bugs, new unpublished versions maybe did not have anymore,
but I didn't have time to test and triple verify the complexity. Then
Darrick also changed traces - I had even less time to fix conflicts -
there were are. From todays point of view, I just should pushed back for
the atomic change, we now still have the worse spin lock and incomplete
traces.

Thanks,
Bernd

