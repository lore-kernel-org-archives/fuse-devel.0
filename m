Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D11368D76
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 23:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009311; cv=none; b=KreWAWk2Ag1EO88f/PeWTNmg+xjsSxC4PARei0//6jdSmxrJhY6BA9VhcfoU6vIaAhruIAdF1VRUy4YnbakrQ5QA+S8B5l9vArzAzhnI5Szd/jU0CZGV9Qy5F+Tvee9MLRHs5e/+vFzFdWLdo2n4T5UJzGiMUr6hb7vHN8iNr4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009311; c=relaxed/simple;
	bh=sO7uQEBmjZTTvEeRemX+xXAH32UjX96Ql0u1t/FSB00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKxHN3Ri00gNWO7yQxfm1Q512bYm+LVb5oEvJFXSxUVQ6WfcEEvIdlurqDZ5AbhhRoV82XVPYmlLzu+1kQUShQSeM5NPC/RWzPzOTr5LlngeLN07wglIh0pfvcIxK0vr2I+62SUys3VAubh7EUTy+YcKnIHHcgSMlmA2LJt0uKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=ZXswrM7+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hBHYR8JI; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="ZXswrM7+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hBHYR8JI"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 84A76EC0016;
	Thu, 28 May 2026 19:01:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 28 May 2026 19:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1780009308;
	 x=1780095708; bh=u+v9bB/LcAkKBmrgB7oV4VssCmFD05h9Vz4zYV4ITJQ=; b=
	ZXswrM7+QLMbK0qh5im5BiaAqs+9VuQR6+wyLmb0ANeOtspELMW8vcwdJCpzqrB7
	YDKp7Rm7hN9Asr/MEg6cVhypvoFlDwhUgGR/UAgYyUezmvULAUIOyQqA9SZSEAdc
	fbGuTNtr1D2aiW6+pjeeEOZKc9GND34Tm2ZezQg5ej5D0w3BadNk2mu/91dVWXcX
	Sb5sh/n7Va+nRvZJk6XzxkxuvhEdrIeIGhqp2BMp4fITAmYvVBvIQSE8dZpgGoRc
	TaiCd9L5aWb38wWwM7VOX9ZyTMBHetdHe+QIzKBMqS7zPivNGiwkhfTznJ0EoMkA
	tSwCMbygu+VD50+4z47ctA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780009308; x=
	1780095708; bh=u+v9bB/LcAkKBmrgB7oV4VssCmFD05h9Vz4zYV4ITJQ=; b=h
	BHYR8JIGEwaKeOVihYQdYSTBL1J04cCEqPi72NqNihfg1Qw7AVTP9988Nc4i+byN
	jt4FL1ZShBTOf26QnJhsiWZwcEwRams5svQC9twHU2LxAl6sDAsm0Tph8c5F30n2
	PuxDgYpUJov51i2qy5Hvt0wt0MwPsDIKCmuX3hsz5Mw8HwXCYqFjlSdwcZLQcUr1
	YweFHUUcuKH0btntZT+AGYqvrwWZ7iwZ+/4y8UjbdxFx7jxeSJxwwDCQuS5USnWH
	984tTi2oyNtkDi+1IN0lXJ/C5OQaXjG7K/8rihleMZKS9vcP7jKVrbbcG4WlcXUB
	D7O4y6ykiy1hCTsEIJIhg==
X-ME-Sender: <xms:XMkYav32bvbcEakhcSUG27si5l25X-WPZrWsT39PrwMHQWDySbq3Lw>
    <xme:XMkYapkKdVkolQuLqc21qjF7I6w98c3mFj5CyLGGx6lV2MJ_tO8vDHMlYqpNqqCzv
    LT-dO7LTjsGkj1V4dN2U_blVsP4Wy5U2sw2LefCf5ulzJPRvw4>
X-ME-Received: <xmr:XMkYamUjCDctq8tFR9lVmY5kJYFIJvFFORr2LE-_q9vd2HgeOVeUfgC2eXSIZibnKG6mDP8jfUDvEMB6J1xu0kCgKtAXy4GJfREqldDzEUKQGz-4LQ>
X-ME-Proxy-Cause: dmFkZTFqFpIFj9j1dVQR6OA5s8sDPcfCI06C7TlplrbazZ2wVfdw+fjKIXU8LqRS/VdlyY
    R2taw2bFm5E+0Vez3zJsaPz4su+W7PxmDek46QCQbC2uLGVaU4VRzCrDX3AJ5ZcqxDXaKA
    rU4ioFFuwZIWn6E0QofRYVmxLsk5R0xPK5emN0YbwJH+NKND5uk3D6nyBrUzzVANNONGak
    0SaGJRmVEOmvSY7fKVivXJwR2XJ3d8zNgyEm0dBwHtg/kSpsT2yy1fr1HKEXZaC1MJgEOp
    8daH3FixLR5PEXeaaP5LFUlmqkzdNyr850/lYvA7FMfzyLbMUjgDJvreetSFcgXG2WtfXR
    8UAS5fqu10rnMI0xd5G5HUDS/f5xtpUAzzXTbjvPG5KAXInMVatRW8L5sc68sB4c5csXhC
    YNK60RmyN4zk6muycBM10oa2wMAolSK/zwRtXOtudBQ4q3XYI8DliazUCRyEAASKqlY4nx
    zwM/gJlyddou+PDHOaohHSA6XjvU8f3XjPqFGeSVI2fBXGYSi07CX1G/zbwXVX6svjWzrS
    0hBn2OvwklHLFSxfrR0wNKVxUdpZWZLX0X6rSUrASHI8INTuR0Os+k1DJd+xoQbSMb2JCq
    nhMem5GKxadN5S8A2GNs27EsdEkD5Yx/JRru5KrygpO5PPD64xyZge1OuKfg
X-ME-Proxy: <xmx:XMkYavuMdSpR94jm0v3p-LDI3hSXBN-j3D_eKZsZ0tN3QziV4hc1LQ>
    <xmx:XMkYapbiFlYel4FXBmGSVsbHyIoYG51TC4AXPuzqKvVwKSti5-GGCA>
    <xmx:XMkYauWF0oPAjGHTUavuNbwFHZWC67j-nJzma1MUonDVt_ExIrTWdA>
    <xmx:XMkYauQBfEEzxZfhHyKj3qculYyp-j8BkfRLYIZRuiRgE48gkE4nSg>
    <xmx:XMkYasG1W_7KoBOTGioKUhLjmZ-R6xlSPBTA_IXbNdCVA0GnUP1vD3Qh>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:01:47 -0400 (EDT)
Message-ID: <92906aae-a3eb-4ea4-adad-7289045fdbff@fastmail.fm>
Date: Fri, 29 May 2026 01:01:46 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>,
 "Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
References: <20260527171808.828637-1-amir73il@gmail.com>
From: Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260527171808.828637-1-amir73il@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/27/26 19:18, Amir Goldstein wrote:
> This new tracepoint complements the existing fuse_request_send (enqueue)
> and fuse_request_end (completion) with a tracepoint at the transition
> from "pending" to "in-progress" at the moment a daemon thread dequeues
> a request from fiq->pending.
> 
> This is needed for tools tracking the in-flight state of fuse requests.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
> 
> Miklos,
> 
> This patch is not technically a fix patch, but it complements the
> tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
> simple request tracepoints"), so it is my intention to backport it up to
> 6.12.y for use on production kernels.
> 
> I came across the need for this tracepoint when working on fuse queue
> monitoring tools [1] for our production env.
> 
> The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
> post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id of
> fuse commands being sent").  Not sure why it was not tagged as Fixes.
> The existence of fuse_request_recv
> 
> This patch is intentionally based on upstream fuse (v7.1-rc2) and not
> on for-next branch, with ease of backport in mind.
> 
> Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan")
> on for-next needs to apply the same change to the new tracepoint as well.
> 
> Would you consider applying this patch at the bottom of for-next and
> make this adjustment to your refactoring commit?
> 
> Thanks,
> Amir.
> 
> [1] https://github.com/amir73il/bcc/commits/fuseq/
> 
>  fs/fuse/dev.c        |  1 +
>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5dda7080f4a90..583155157d117 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
>  	req = list_entry(fiq->pending.next, struct fuse_req, list);
>  	clear_bit(FR_PENDING, &req->flags);
>  	list_del_init(&req->list);
> +	trace_fuse_request_recv(req);
>  	spin_unlock(&fiq->lock);
>  
>  	args = req->args;
> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
> index bbe9ddd8c7169..289a279b3c312 100644
> --- a/fs/fuse/fuse_trace.h
> +++ b/fs/fuse/fuse_trace.h
> @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
>  		  __print_symbolic(__entry->opcode, OPCODES), __entry->len)
>  );
>  
> +TRACE_EVENT(fuse_request_recv,
> +	TP_PROTO(const struct fuse_req *req),
> +
> +	TP_ARGS(req),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,			connection)
> +		__field(uint64_t,		unique)
> +		__field(enum fuse_opcode,	opcode)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->connection	=	req->fm->fc->dev;
> +		__entry->unique		=	req->in.h.unique;
> +		__entry->opcode		=	req->in.h.opcode;
> +	),
> +
> +	TP_printk("connection %u req %llu opcode %u (%s)",
> +		  __entry->connection, __entry->unique, __entry->opcode,
> +		  __print_symbolic(__entry->opcode, OPCODES))
> +);
> +
>  TRACE_EVENT(fuse_request_end,
>  	TP_PROTO(const struct fuse_req *req),
>  

I find the name 'fuse_request_recv' a bit confusing. Why not
'fuse_request_read'?

Reviewed-by: Bernd Schubert <bernd@bsbernd.com>


