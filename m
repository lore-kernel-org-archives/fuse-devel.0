Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8723FF1
	for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053732; cv=none; b=p1ENJVqItuwRLeP/OPLx3MXlrN81G1PBDDBcHkihznkkdgjzqtmRZ2cptaQ9uO5/vSNdAXOj4t3YFUoN4XbBcjRlQbFJOOgsL/AhCOUy7zCE89pI89VddlAf5WwnR91dqFQIm8keBLvdWDEWT7aprzaqySdVB71SmI2z1LaL8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053732; c=relaxed/simple;
	bh=Y480n0CkT3x0aYZwIQkQ8keQT/aHnTS9YGfQnYkb4wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZWU7sPfo0cGDQMnoYheU4CdKRn09M27jCuiz8BcvMsUrIKSJhBaWOzrU6ZSW7KhMvQzd+GUKybLAQFavC8v103Tm4bJ9vJK3ZPmsIAysgUMmWeIgu5yPIiUUrFJyNFSSr66ACyaH2uf+uEo41cg1MlMzA/U0bR2iYargMEePgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=SpiVGhFm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bz7RDIWI; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="SpiVGhFm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bz7RDIWI"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 5AC2CEC01E2;
	Fri, 29 May 2026 07:22:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 29 May 2026 07:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1780053730;
	 x=1780140130; bh=4oBCPu/QwL2NF1a5HAOtZG36cGwt2h7ewd9CDxd6KOA=; b=
	SpiVGhFmY/ceM8mr5/m8Fnz6A4wovoaF66bffMcZ6caU3mG0u/iq+302dM+6cD5O
	LfkWk5WMvb4lvAhDf2FTHvYlW1sR8790lfKVdhSKXyhgtUjkEr+WMwYmr3foGsIq
	bBsTTn+XnBpUc9/4OWKznAVVzcb3hhK0jGlwdCCwhMhnrp49U9ui3J54Uocb8cbb
	/JO9BIa0LBageVQZ4D1mxIyOQoZ1PzY+Dg/+IQgokGFyQL+vl84xoWvoulKIeN6+
	kHeWnpr+w+CTZZyiuQAnAaUm2FvzTuld83Wh98NHm45dIkmqydERM+JU64lp+UIg
	RYmKoUHeRDzuENREPfMyGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780053730; x=
	1780140130; bh=4oBCPu/QwL2NF1a5HAOtZG36cGwt2h7ewd9CDxd6KOA=; b=B
	z7RDIWIWa63sm3K3SA/+8qhtJ3WN8iS9ArkHKOOTAmByKwH9ov0pgKY2MDlCADJg
	RqVBwz95TPTZfPF9kM695BaFUtR2dj75yFw7siLi4lH6EQQd26P83PSgiim8ZCPj
	EToKKCXkUiKE3TVo6kKzzP3d59SxQ2asAFmsw96LflTZJnZkM7CHjcAX2HVrqq/y
	Bsla0L/F+SXwPmQzhVvMZYW8zYmhR+MVbL0xUBVNmu31EBWlP/7pkkIWMqmvShG3
	+irb8lX3hrweUGfLztJEjGORfeDSKaAOJoCh7bueMmaFxJXQJochth98uJj8ILkl
	yZZ+sh784r5b49E1FLUjA==
X-ME-Sender: <xms:4nYZatxYVoTsspyCour1xOyFOgW0Xp5i_CUzGNae1iIPjAp9pX09Tg>
    <xme:4nYZaowQfEKGzxxJ6ab_QS1SemyNHUaDM_2N8WOs5yjeZNqQx11qLzxxOqQoaU6JX
    CI2xaF00PuRmVXdUayEEknw4QuDU0OzhQJ8LSetoG9hvyBEJhAF>
X-ME-Received: <xmr:4nYZatz9YfQmbAyDkga5cGG4pyIVe17_qE9n0VgTdgAk3nCeeMxFt4A2zJFfFjmSzCAI3xn2QK60lrIfO23jJvmzzUh99MbmXmpxB1yaMtonLIr9iQ>
X-ME-Proxy-Cause: dmFkZTGEOS9MInoRiUXQPZzbXtTcCEmB6DQZ39Z7AHnDb6Yu056uKTZwISHFNMeZ8VyNfz
    KPTuyM8QutqfxsQWNsEV/RITX3qItkHavQfmcFc0gQ0GrVfVHUzMKwtCWDl/Z6E/Jh4RQ+
    sIjyKwGiS3BVqt1j25UqaziNu/ilPcEUuBpnKyURvI/4Qm3PpCc4JrPF1D6F/ihfGR10IX
    N8NM2ohUjfrjxfL9b5bonqcjOtN+kIqYeRUCP3ycJBxzeZL/KtInu6K3Yo1kkKvDtcSQJF
    WlEEoDBET9KxkDOwaDqtST7xo6xS4FHKOBcM5O4VZvbt/0hZEy6NOmbABO2vqKmfay0NYJ
    KYnnxlpulNaPVXSkV3fesrza4VOQogwzSm+/61NJcuBWQzo70ZrRzgj+Yka2Fp+5Kdp8eu
    jlFN/iXXZtGQCW8KRIqm1ftqeic0oNjbSBl7m8mf8pbWooQaOBZloZEx74l/laRBzEIgJ0
    Z5S8fTCjQ7WLCsVFMtVh75fPOaRkUyFxMD+y8BdJv1IhRg/ICcsIUTlv9wzavKEPJDyp54
    zX9fJ6o26cA3eAM1k1GZYw0G1v+oRNWdG8PN4SdO8RkTuXIeQKXR0uPiPvi6PUSlJnoMPE
    Ezh+OMmOQRKBIrXTeX8qo8TYlGEIjaRs4TVv985RbHXS+AO1o+6UEMdq+ZXw
X-ME-Proxy: <xmx:4nYZaqZ7shtDAZF-hPCCuigT9E1hsT4m-ERt2gmI_cFDLBeCtbrEsQ>
    <xmx:4nYZamUjGhuNDgpErY6lad12xdzPwvSM4zCbiemRUbLXieEt4mrzVw>
    <xmx:4nYZaggYQ5MfRs2baQRCoMJajgVPg4_HvW7CcqTibdwYA3TZ7HNAlQ>
    <xmx:4nYZasus-Qk3U33q0m2DFzsBjJ6SDnOw4jJigHfe1JmpM3BXnBwEQg>
    <xmx:4nYZakS_WVNFROTKNJ-WfIdtZbRFNdqaEqnWJnDir9aToxrOY8jcnJkR>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 May 2026 07:22:09 -0400 (EDT)
Message-ID: <cc8d9d33-444d-4c5e-9def-428794d87f3d@fastmail.fm>
Date: Fri, 29 May 2026 13:22:08 +0200
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

Reading my own patch:

Rename trace_fuse_request_send to trace_fuse_request_enqueue
Add trace_fuse_request_send
Add trace_fuse_request_bg_enqueue
Add trace_fuse_request_enqueue

with

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index
1ccf5a9c61ae2b11bc1d0b799c08e6da908a9782..8e1a95f80e5454d1351ecb90beacbb35779731bb
100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -281,7 +281,9 @@ static void fuse_send_one(struct fuse_iqueue *fiq,
struct fuse_req *req)
 	req->in.h.len = sizeof(struct fuse_in_header) +
 		fuse_len_args(req->args->in_numargs,
 			      (struct fuse_arg *) req->args->in_args);
-	trace_fuse_request_send(req);
+
+	/* enqueue, as it is send to "fiq->ops queue" */
+	trace_fuse_request_enqueue(req);
 	fiq->ops->send_req(fiq, req);
 }

@@ -580,6 +582,8 @@ static int fuse_request_queue_background(struct
fuse_req *req)
 	}
 	__set_bit(FR_ISREPLY, &req->flags);

+	trace_fuse_request_bg_enqueue(req);
+

@@ -1314,6 +1318,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev
*fud, struct file *file,
 	clear_bit(FR_PENDING, &req->flags);
 	list_del_init(&req->list);
 	spin_unlock(&fiq->lock);
+	trace_fuse_request_send(req);

 	args = req->args;
 	reqsize = req->in.h.len;


IMHO, trace_fuse_request_enqueue / trace_fuse_request_bg_enqueue for
adding to the queue and trace_fuse_request_send for reading/handling the
request is less confusing.


Thanks,
Bernd
