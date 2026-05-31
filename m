Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB733F58E
	for <fuse-devel@lists.linux.dev>; Sun, 31 May 2026 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780258173; cv=none; b=ioq+ooq5ohbJFykYyVCiwmjTqVgnJ8SvIU3OVijRlR3P/cmorMwcwn2oYkkHs3IFGYDv4lq7ROPZr9LWE37lhg0OTvT3/hH7JLg8Xrqfqwz+wB4ogI6xiBJqj47rLX1jvZ2RHcDFaKTINY6YhlB/HrOZyvwniamUb9XNGbbkOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780258173; c=relaxed/simple;
	bh=swAJEzvIKYteiMblG25UVnp084KkzgrP+5Uieh71N8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1TqdeBikL+BZmzfoKnEfjZQopfjSMKYaLCOOMw4fr8BNsoqWDkHU0VxNNjndcOu8FiPEtquJLLecdY3hiOBeiDjG/ovl7o8bziRKMJyplBGu0a6eBV3RtkOx3mgsCDqbKlAnQ5SAqWJJfkUVA7hrV4LAMwh4JdnQxFm2F+Rw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=NABVucEx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NcSxJ650; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="NABVucEx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NcSxJ650"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 262A3140006D;
	Sun, 31 May 2026 16:09:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 31 May 2026 16:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1780258170;
	 x=1780344570; bh=vnXsMOXvM92QYWOYPpp5aniKzo8wvo0dScJOS5eBuqI=; b=
	NABVucEx58m7+zVAjuZEcBNVCRTAn5l71S9Jr/oPUQd1vlGUeZEv4cecmchcQA1X
	xto28nauraGK7fwqrJDvWD3gJTLW6kJzthNVFszdu1Ojlil4IFXbSkAd1PA8QGZK
	YwoAMkvEVYYV+Fd6og4i/zoYt93mZggbAWHdBEbcYNQh38l5G0lWsTA3CATF1nlO
	hNKq7XGXaImC0fgz8UQ2AjV2P/2+LtPiY49buMW4vUEkVFm6/36VkPRU4rtLV65/
	/xymMT12LTeYI4qgyGdH/cktr/yL05FcsM6rl9E0g029oI6WopYJEuGnZuLHi3+n
	Aqa8aXYwImIBahkOq75joA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780258170; x=
	1780344570; bh=vnXsMOXvM92QYWOYPpp5aniKzo8wvo0dScJOS5eBuqI=; b=N
	cSxJ650g6IrSR6G4507GEHrjpeqychWgmd1lR93PNTUGcXaJ4kXiCAggg9xB+9QR
	Njwxo+5nSFWOg5LMkFjO3h+9b+uMM/pv9ythjw0HaxoqitZnF+1Caj6wykK4Wpe3
	p9BYL6kajR9GbDx37Vg0M+dgS77MPrsUVhnQL6Yjmplmz0yLxDDWseyi3iOCjbZb
	wY8PDRAZYVdsFBJV+sf+KqFSp1Jx698eX3bBriP0mxm0hWxxEzK3KhkrPrmnp1Nx
	X+kbUMFkd/P/do3WUo+sBeiY4sU0H9YAm1fRXlMD6qb02tyJFl26s4yiTBLVoajc
	YDII4ELVo14h7KLVFZZWw==
X-ME-Sender: <xms:eZUcaoKzEnFR0J7CdXZ-5tSp3HYuPMeEeGKzZp1hFYjO-in2846SZw>
    <xme:eZUcavAgQkW7sR8Bpt6ExZj40OXTUAtkSTgGJfL4z0l5g3IrDE79VOb07kt4uo7-9
    YsrCRx1hlmLYtAqdo25T-VZvwLqdmVUQ9ofFtbn8acA3gIMRLbj>
X-ME-Received: <xmr:eZUcahA5EgeypVZVAgE4c97fv6OnGzM2lHNs4pd1jvvDlb-7zz4mXiqqC7dW3UMcNwdaBVRUkqpHWGx4WsXVsc_p9QBI0vns_AgOR8Z2C2_9xL4jpQ>
X-ME-Proxy-Cause: dmFkZTFBP/k7d7jQTMRTuX8GY244Kb8EVTVomvI0Q1lAKgA/rQ6dBAzUP/wGp1AGjtPV2b
    xzGQcrSNKJo34ggmnq0BzDBr6/DWW9NeNFtvuxwaeekUe2A/xQKhsnO8d3qV3aB35q74qH
    MeTYFpaUxJ7zNaaQmVLBQSercxA4gAKPO8UmuR51IIkcVz8hyskb9I/1WjdfYv24XjddkN
    qLjfIGA6o5jR8fBNHseZSbBEdzp/u5RrDopn0qaNqGJ6lRGMgbUKFxPc+ruLq6TCrPTo4d
    zIb4VI4Dq7DaKegdDe+HSVwj0TxlFBzCwx5wJvmYEOyRs+Mp+2FnmQEvPNnIvrY8q816SJ
    2Bgv+I7nOk3Eegi05EM3Asgd8J3wVRBLN/YmqSBATz4nbCuf7r4WT6rYmqza722/9KIIX+
    HwFBJNCIA53MC6UrfeYdblt7AwnJbjcFcZ+hZ3tqWZzhw0vLqR3HmVLvYqL5ujMUIUYkaX
    pLdXMuQ/+pABbqyZBJOWKSIb+Ia+w3PAX0bUtMoqlu8pOQIrMlArIyPHtoyou7rrbgSZoH
    9QSwnEUd/StpIAvEDMS8MrwerItsonHqaMIC1eiJ5aU0q0Nt4tmuPiSRQPkwV7N1qUwb7o
    osx6GzHv2GvsHIYFGYz9J2k6fpcMLMGcRVzbDkXF6JCAWt3pg1P+Q55qCdCQ
X-ME-Proxy: <xmx:eZUcahDWZ2JKglL1kx1yVnH1fme6zTfNL2rzoUvPqULBKtRn089Uaw>
    <xmx:eZUcaspBXpxAQ89561pIFygyk51Yx4f50u50dCSuQcAm6qkNhMWUnw>
    <xmx:eZUcarnYcRnHjShKfzGzpdXONpgebWgT1c9wGKVJLlTY-ckv91Wc9w>
    <xmx:eZUcaszE9Kw7eG5_5HnJR9YU5bwQ_Ijvj1QY3v1L5Ig8VL7KmpArmQ>
    <xmx:epUcamiv4STfBo_3DgxjzaXhcn47-d-ERORXewwmx0b5bFW1RLfL-O3w>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 May 2026 16:09:28 -0400 (EDT)
Message-ID: <76dadd77-5909-4c1a-baba-183e9af8d212@fastmail.fm>
Date: Sun, 31 May 2026 22:09:27 +0200
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
 <cc8d9d33-444d-4c5e-9def-428794d87f3d@fastmail.fm>
 <CAOQ4uxhUEG71XbrGyvCDoA=6yi271f48LDD1r4peec8uMAWaPg@mail.gmail.com>
From: Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAOQ4uxhUEG71XbrGyvCDoA=6yi271f48LDD1r4peec8uMAWaPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/31/26 19:56, Amir Goldstein wrote:
> On Fri, May 29, 2026 at 1:22 PM Bernd Schubert
> <bernd.schubert@fastmail.fm> wrote:
>>
>>
>>
>> On 5/29/26 12:37, Amir Goldstein wrote:
>>> On Fri, May 29, 2026 at 1:01 AM Bernd Schubert
>>> <bernd.schubert@fastmail.fm> wrote:
>>>>
>>>>
>>>>
>>>> On 5/27/26 19:18, Amir Goldstein wrote:
>>>>> This new tracepoint complements the existing fuse_request_send (enqueue)
>>>>> and fuse_request_end (completion) with a tracepoint at the transition
>>>>> from "pending" to "in-progress" at the moment a daemon thread dequeues
>>>>> a request from fiq->pending.
>>>>>
>>>>> This is needed for tools tracking the in-flight state of fuse requests.
>>>>>
>>>>> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
>>>>> ---
>>>>>
>>>>> Miklos,
>>>>>
>>>>> This patch is not technically a fix patch, but it complements the
>>>>> tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
>>>>> simple request tracepoints"), so it is my intention to backport it up to
>>>>> 6.12.y for use on production kernels.
>>>>>
>>>>> I came across the need for this tracepoint when working on fuse queue
>>>>> monitoring tools [1] for our production env.
>>>>>
>>>>> The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
>>>>> post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id of
>>>>> fuse commands being sent").  Not sure why it was not tagged as Fixes.
>>>>> The existence of fuse_request_recv
>>>>>
>>>>> This patch is intentionally based on upstream fuse (v7.1-rc2) and not
>>>>> on for-next branch, with ease of backport in mind.
>>>>>
>>>>> Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan")
>>>>> on for-next needs to apply the same change to the new tracepoint as well.
>>>>>
>>>>> Would you consider applying this patch at the bottom of for-next and
>>>>> make this adjustment to your refactoring commit?
>>>>>
>>>>> Thanks,
>>>>> Amir.
>>>>>
>>>>> [1] https://github.com/amir73il/bcc/commits/fuseq/
>>>>>
>>>>>  fs/fuse/dev.c        |  1 +
>>>>>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
>>>>>  2 files changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>>>> index 5dda7080f4a90..583155157d117 100644
>>>>> --- a/fs/fuse/dev.c
>>>>> +++ b/fs/fuse/dev.c
>>>>> @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
>>>>>       req = list_entry(fiq->pending.next, struct fuse_req, list);
>>>>>       clear_bit(FR_PENDING, &req->flags);
>>>>>       list_del_init(&req->list);
>>>>> +     trace_fuse_request_recv(req);
>>>>>       spin_unlock(&fiq->lock);
>>>>>
>>>>>       args = req->args;
>>>>> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
>>>>> index bbe9ddd8c7169..289a279b3c312 100644
>>>>> --- a/fs/fuse/fuse_trace.h
>>>>> +++ b/fs/fuse/fuse_trace.h
>>>>> @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
>>>>>                 __print_symbolic(__entry->opcode, OPCODES), __entry->len)
>>>>>  );
>>>>>
>>>>> +TRACE_EVENT(fuse_request_recv,
>>>>> +     TP_PROTO(const struct fuse_req *req),
>>>>> +
>>>>> +     TP_ARGS(req),
>>>>> +
>>>>> +     TP_STRUCT__entry(
>>>>> +             __field(dev_t,                  connection)
>>>>> +             __field(uint64_t,               unique)
>>>>> +             __field(enum fuse_opcode,       opcode)
>>>>> +     ),
>>>>> +
>>>>> +     TP_fast_assign(
>>>>> +             __entry->connection     =       req->fm->fc->dev;
>>>>> +             __entry->unique         =       req->in.h.unique;
>>>>> +             __entry->opcode         =       req->in.h.opcode;
>>>>> +     ),
>>>>> +
>>>>> +     TP_printk("connection %u req %llu opcode %u (%s)",
>>>>> +               __entry->connection, __entry->unique, __entry->opcode,
>>>>> +               __print_symbolic(__entry->opcode, OPCODES))
>>>>> +);
>>>>> +
>>>>>  TRACE_EVENT(fuse_request_end,
>>>>>       TP_PROTO(const struct fuse_req *req),
>>>>>
>>>>
>>>> I find the name 'fuse_request_recv' a bit confusing. Why not
>>>> 'fuse_request_read'?
>>>
>>> Well, to balance fuse_request_send of course ;)
>>
>> Reading my own patch:
>>
>> Rename trace_fuse_request_send to trace_fuse_request_enqueue
> 
> IDGI. I don't see the value of this name change
> Darick already fixed the _send() tracepoints in 6.18
> and I see to reason to change them and break existing tracing scripts
> unless there is a really good reason to do so.
> 
>> Add trace_fuse_request_send
>> Add trace_fuse_request_bg_enqueue
>> Add trace_fuse_request_enqueue
>>
>> with
>>
>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>> index
>> 1ccf5a9c61ae2b11bc1d0b799c08e6da908a9782..8e1a95f80e5454d1351ecb90beacbb35779731bb
>> 100644
>> --- a/fs/fuse/dev.c
>> +++ b/fs/fuse/dev.c
>> @@ -281,7 +281,9 @@ static void fuse_send_one(struct fuse_iqueue *fiq,
>> struct fuse_req *req)
>>         req->in.h.len = sizeof(struct fuse_in_header) +
>>                 fuse_len_args(req->args->in_numargs,
>>                               (struct fuse_arg *) req->args->in_args);
>> -       trace_fuse_request_send(req);
>> +
>> +       /* enqueue, as it is send to "fiq->ops queue" */
>> +       trace_fuse_request_enqueue(req);
> 
> Looks like this patch is based on old code?

Sorry, I had posted part of the the old patch-

> 
>>         fiq->ops->send_req(fiq, req);
>>  }
>>
>> @@ -580,6 +582,8 @@ static int fuse_request_queue_background(struct
>> fuse_req *req)
>>         }
>>         __set_bit(FR_ISREPLY, &req->flags);
>>
>> +       trace_fuse_request_bg_enqueue(req);
>> +
> 
> Is this path not handled in current upstream code?
> 
>>
>> @@ -1314,6 +1318,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev
>> *fud, struct file *file,
>>         clear_bit(FR_PENDING, &req->flags);
>>         list_del_init(&req->list);
>>         spin_unlock(&fiq->lock);
>> +       trace_fuse_request_send(req);
>>
>>         args = req->args;
>>         reqsize = req->in.h.len;
>>
>>
>> IMHO, trace_fuse_request_enqueue / trace_fuse_request_bg_enqueue for
>> adding to the queue and trace_fuse_request_send for reading/handling the
>> request is less confusing.
> 
> Potato potato
> enqueue->send / send->recv
> There will be arguments for and against any names we pick
> I don't think that the name matters a lot here as long as the
> required information is provided to tracing tools
> 
> My question was, regarding fuse_uring_prepare_send(),
> do we need a _recv()/_send()/_fetch()/_whatnot()
> tracepoint in this code point and whether the pid reported in this
> tracepoint is useful. Is it the libfuse worker thread or something else?

Yeah, that is the libfuse worker thread. I don't think the pid is
useful, the tracepoint probably is, because it allows to determine how
long requests have been queued.

I had created a script last year based on the old kernel patch

https://github.com/libfuse/libfuse/pull/1186


Thanks,
Bernd
