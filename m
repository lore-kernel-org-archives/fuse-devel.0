Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55514C8FE5
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656604; cv=none; b=Gr1JfRmvb3VN93vWzwFg0AM+yCGj8pZ3FOGe7OZ2gty1bcebYCTbvY0jsDJv2wMKmx9wVIxxsem4a9Llz8aenZroyiCRJOhVEoXm+gqRvkXNlnnWIowEwgisIpNsRjJxaJHtMV024rvOs31tXydwL3eZOL9WsbKja5hZ12ZP154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656604; c=relaxed/simple;
	bh=mHrcIG4ilTj9ImGm+PSd5Jg7KLzoisPS9c/EM8lMGN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hP4z0cYkTmpN7jufi/jdcYVxRyBNc6dQ8+tCPjBSsKhH9p/FtAeahKjxQe6B8gMfLlcU6fhUF5lj42MiRjeKaqnsEhinZUKDsSKx/MlWcwQhgWMLYgp/+AfolHRIdpNmJozScBdBqCs+K4lKbmBGYi4bDrkajX+8zNK9lsAlOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=pIXLT5rO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZxPP8El2; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="pIXLT5rO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZxPP8El2"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id A4845EC01D2;
	Fri,  5 Jun 2026 06:49:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Jun 2026 06:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780656599;
	 x=1780742999; bh=+cctf6BPcRbqilzGIojKZk6vsUePPcl7FZd+QMhrXU0=; b=
	pIXLT5rOPIhwhAFHMOiOLhHXw9M3PL9sCTGuvOD7GB6P3dC52wzWx/czdaX9zH88
	7zVIpPp/wR791SjxF/hbt0CAGX2Y3lAFKynQa1FH9q4MVQxz0rKwAal+JVRv7n8m
	EdTip0Vw/dyaZGkb9rQY4k3aanfR5ZctM9LciO1cAi1C6H4xMeL+45ySuxGqD11d
	tRrXJGht+3zeIrvLitC9S+itin9aupPFrT3q8OmwQyUow0jhuvI2Nfsf7PVNG2ui
	SHLMMcXYxeSUAh4WESfoxabjuhPxF8a6hKnzjA7IDtgQXwJwjByzs+16vyjVdNH8
	0917zo6EPQMDfGZKAPM2DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780656599; x=
	1780742999; bh=+cctf6BPcRbqilzGIojKZk6vsUePPcl7FZd+QMhrXU0=; b=Z
	xPP8El2YMSoYKz3rGto+Rka2JielwbZ8zfs8CMjVwGtA7T/NqR5Px3gyuzXsUYBb
	V/lnOD54DJbVuj3aOMYwCHo69KzMPB3+0HfKJKF+CFG57u5yPGh+7/j2sN0Hfd07
	PwwyWubr8rz05nrf4lA46hY2CwiWFuGQLL5S8q1aBs10wPwOpt5Z+dUSa3L24sij
	ghfyCdzLk7j1VXc6MWHShOqZj0CKQYMzRN6od2vdlYmNUyQhz/mJ9FEWoB8hupXi
	X+OPspWe/dWhkumFNFBeqOLAaeQYnPxEYN6J/vtyXFvDdB0flxbxh+Zh7CqQWXPu
	nK5Sjjv5pLDJVwYzYinwA==
X-ME-Sender: <xms:1qkiakcuEB8ncgP3juH1d9zoiNBjTY2nG4cqtxEh1I1q_OVJJG_uNA>
    <xme:1qkiapR_YC_1Pe879IgD96mSfidZmTQxESnU-pi2fgxfFmws1c2pu_fEjACWYhNBe
    0G87F6fX1sHjzYGGO1kN3OC4s9cvEXKIfp6kt7yFVTEp9Mo8hR8>
X-ME-Received: <xmr:1qkiagIiQy-fFoiVMq0evqaka6tEXjoYSIcmgvqF6_2--v8EegLl0jnCXXYsdrJvEP24RqEGEu6nMafHk5h759Z7dnG2S84cFbBPTf_7cju4l4BC-g>
X-ME-Proxy-Cause: dmFkZTEUI4FBmzQX9FhiYNZKfq8GR8sGruH1R667KheXRe32ARczDDOXYK0r9kVsuJIzNa
    /2//+KRV3zM3jA+HBXnqn+KFkpnqOsyZbM9H2dxnbt4vLv+xpEVt1PLivAOfYsO51B5tyb
    4UY+ClWyJ7r8ndxYmxM346xt162dfrrF6MzVoUEUt8eYOryfn5+YtqAi2NvNwT2S+0D7ct
    QSnlDmw4YXAXIMOIkAjmyISUj0/uWYHop7XrM9bMxLQDDtrAq9YM8bLnZLrT5+yO0z5YTs
    cv0PVT7Nwd6PD+vmSBDgwY7LEmC6uabq92f6cVfF9qA79evCW0jYmR9hfvksWKRlxVujIy
    Cu1Jv5VMttp4DEE63x7gvlQcCgOFMo14q7eUnMiRajtJ4UsEYjKZZm2E0wPjh0RDSwfrYg
    29flqo4ZjoYG3aaJ69/WatCVXedcZHCtIZ4UTOh2vPOSl8f5Q2UlkRkfx7LBeQI2cCR1t6
    JpYhB/KxM5hCDY7ol+Oh4SksxbdJWEJKXQVVQto5MxBoJB2YyH9MFA+mvK6tegX+N/U+VJ
    5mktGPph90MXXgyJDg0pVjI+FIwn0q3IKFt9YyTmL4ZPq9gSRgRklCDQphUic3K6GO22sy
    OCs3hT+qGW5ZKaFqtzZYC/smJBpvanJ7glXE7NOE7AMeGrLhPtNSCMu2s0tQ
X-ME-Proxy: <xmx:1qkiamK-_V5wxjm18HpqSpxSUDBarnKzyImq4ujxfRZ6ZNh5xmIo0A>
    <xmx:1qkiariELn0N0cEUgg6wG9zmh1lCCNV-kCr_brRrS_NDgcO1SsgDtw>
    <xmx:1qkiagPjHcRSfrBO5WEkg7ZH9zkf7DqCWKYW59HCoRAKzIjoVnD8-A>
    <xmx:1qkiamoc7cR5w8Eg55-F_BgByDfOeC-5GxL0aS_0URfsDgPcFHrOAA>
    <xmx:16kiat6TC09VJYNfjKpqdLIZJO09DZZpan7FyMn4SoU5__ZIWsZQrmyi>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 06:49:57 -0400 (EDT)
Message-ID: <a02168ea-549d-4683-8565-08a39b64eb7f@bsbernd.com>
Date: Fri, 5 Jun 2026 12:49:55 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] fuse: compound commands
To: Horst Birthelmer <horst@birthelmer.de>,
 Amir Goldstein <amir73il@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>,
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>,
 linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev,
 Horst Birthelmer <hbirthelmer@ddn.com>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <CAOQ4uxjCKFdxryKeLQw3M4C7Jn8tOQzUELqBSu8s5nOU37m4_A@mail.gmail.com>
 <aiKGgCRxCPOavEnu@fedora.fritz.box>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <aiKGgCRxCPOavEnu@fedora.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/5/26 10:49, Horst Birthelmer wrote:
> On Fri, Jun 05, 2026 at 10:12:59AM +0200, Amir Goldstein wrote:
>> On Thu, Jun 4, 2026 at 11:51 AM Horst Birthelmer <horst@birthelmer.com> wrote:
>>>
>>> This series adds a single new opcode, FUSE_COMPOUND, that bundles a
>>> sequence of subrequests into one round trip.  The wire format is
>>>
>>>     fuse_in_header (opcode FUSE_COMPOUND)
>>>     fuse_compound_in
>>>       fuse_compound_req_in
>>>       fuse_in_header
>>>       payload
>>>       ... (repeated per subop)
>>>
>>> Compound is opt-in per connection and discovered by trial: the kernel
>>> assumes support and clears its flag on the first -ENOSYS reply.
>>> -EOPNOTSUPP declines a specific combination without disabling the
>>> feature.  In both cases the kernel replays the subops individually
>>> via fuse_simple_request(), so callers never need a separate
>>> non-compound code path.
>>>
>>> The series ships two consumers:
>>>
>>>   - open + getattr, used when fuse_file_open() needs both ff->fh and
>>>     fresh attrs (O_APPEND, or cached attrs already stale).  This
>>>     closes the open-then-stat race described in [1].
>>>   - dentry revalidate, fusing LOOKUP + GETATTR when both the entry
>>>     and the attribute caches are stale.
>>
>> I am not sure if the intention for fusex is to carry over or phase out GETATTR
>> in favor of STATX, but apart of the strategic question whether FUSE_COMPOUND
>> should or should not be added to current FUSE protocol, we need to answer the
>> more concrete question:
>>
>> Is FUSE_COMPOUND intended to improve existing unmodified servers
>> which link with newer libfuse and run on a newer kernel?
>>
>> If not, then maybe we should start with OPEN/LOOKUP + STATX
>> from the start.
> 
> To your first question about phase out of GETATTR, I don't think so,
> since fusex will use the same opcodes, so it will be there and we will
> have to fall back IMHO.

I agree with Amir and also with recent DDN requirements for DLM - there
is no good reason to keep getattr. Basically for open we need to know
the updated file size. Depending on the backend implementation, getting
additionally the time stamps and other attributes _might_ be expensive.
And that exactly there the statx mask helps.

And I don't think it is related to fusex vs fuse. If libfuse or fuse
server do not support statx with the mask, well, then open+getattr will
just not supported for open+getattr - existing behavior?

> 
> I have told this to a couple of people I have talked to about fusex
> I would actually favor to negotiate supported opcodes and features in fusex
> and adjust and overwrite the write operations accordingly. This of course is
> miles away from the current state.
> 
> I don't think compounds will do anything for fuse servers that do not support it
> and that don't have special cases that could be made faster when basically knowing
> on a semantical level what the kernel actually wants (this is like some sort of
> lookahead in fuse requests. If you are in fuse_atomic_open() the LOOKUP you are
> sending is most likely followed by the CREATE right down below ... but the fuse
> server cannot know that unless the kernel tells it)
> 
> It could have been when the compound handling of not supported operations would
> have been in libfuse (which theoretically it still is), then you will save
> user/kernel space switches, but when the kernel has to step in to do the 'legacy'
> calls you actually will lose that intial try, where the fuse server tells you
> ENOSYS or EOPNOTSUP.
> 
> So when linked with a not yet existing new libfuse, we could get faster due to the
> lesser switches to user space. Do you think that answers your initial question?
> 
> I actually have an implementation of the atomic open (this is counter productive
> for upstream, but I'm using it here as a concrete example to calrify the more general
> point) and since our fuse server can do the atomic open  way more efficiently 
> (everybody knows by now that distributed locks cost you performance) 
> I get 15%-20% more performance on metadataa tests.
> 
> The definitve answer here is probably somewhere around 'your milage may vary'.
> I'm really interested in further discussion about this ... and your opinion here.
> Would you want to use compounds for some case?
> 
> BTW, OPEN+GETATTR is a special case of OPEN+STATX, isn't it?

Exactly, except that statx has a mask built in of what it needs.


Thanks,
Bernd
