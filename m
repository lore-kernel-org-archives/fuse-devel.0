Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8F255F2C
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779489529; cv=pass; b=HFgkM7r76x4nLnx9V2C1u78920BfgHzUySLLfA+secH8PNWVDJzGO6VvMug1+FKNCKNTWi7BIGKP+d0HGxet3bndEuT0THXwMH8dOp1YmSB7sQj1ZJUwAiWw8T5N+dF+F4tHyvp2Aaj8Jnw5/hEKtSGavxGcYMxhNqiWFLkkzCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779489529; c=relaxed/simple;
	bh=Kbcb/mGzVtXl16CEWULvWClXiXf9p3ZYuWWQLlbvgak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaKclNFbBJZDkETQXCyPsdEI0lRk2YWSCmb6XjRWfu5xuSBErbfyOtbArHny24q17UfzldiIjUhhKxSfYpqpYZsRvyqKJ10+uzapzTRuduqB+nr87+nTQg8tu1qq5oJf0XD2p77C2jLnHks4+ZAfySiJ4qK9KR1EAfkUzfYCqWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGAspY3e; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGAspY3e"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44e1860558fso5091762f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 15:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779489526; cv=none;
        d=google.com; s=arc-20240605;
        b=JGQdk8NQ1Mavx03zJ+qzD0Zfr0bAKeKVtlcFfdaqxClXI0rYsBihGG3H5zvrf3DDlm
         383fL4oPwh8Gkmeyo2CzzRu9VSYnyVJMrKVSYsSIh3JcA3wVDmC2H7L+JH+lx6ssgo1R
         7rPTxl99tYmJ3nuUETRQ1KbdeNOHxXuY7l2sKNa0Jnn0d9qWO8TNCs4KcTLTzbymw9m6
         v7TkNSMEFbyPrLnp/lT8RzNohmTqfsv2omgpvzcxvQnV7FgormxsUmfgG5Y+Xj6/EOzg
         VgWjOCOzr4TS3equeR9o+v9BkN+d5x+XnaLiqHAF4wg3a+NxVGQdnkllpnzEccl97aYy
         O+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KaERKktJOUzP8jxu4iwBPFlbaa4OGX3jXfTdS7iBxk=;
        fh=W4rnO21pXx4VBArGlptF+UrOYTQIQpEzotKc2RODpz4=;
        b=TOY/RLQ9OwElPawjWkDLLLkNpdLRNkGXzXWcOhnBgzxPuMOW1poqQXvFLq/n2sxSoz
         tOpynvNzOBKWBrNeHKFbqEi66sAihe4v8OGfiAYWD4w/rbHBw6Dz8qZbwmGv7cNqdufr
         x/WakPOMMaaduhD9BXqtdnZdeTAL2AEuYnuhmU7XFqy4I+bH2WiNjP0UmaZblY6nrfuN
         5fxCNMaiEvg6wpZ9WMUdB8qS3bPU09akRWIweiP82lb8ONL9ZQoBTzOi3JffVJ9hf6iI
         jhyRw5gwQNPf0g5NejtaRKHUYk9iXo6+0odZong1MDzFMh0j7BfxSmZd4tDEqB4RX/sq
         GttA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779489526; x=1780094326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KaERKktJOUzP8jxu4iwBPFlbaa4OGX3jXfTdS7iBxk=;
        b=cGAspY3e/rdpr+VgDnUsWL3RSFQgrR6B3zQaytW5oxDykS/IdmHtco6kksp5OZF+Nm
         IBHPQOPRPy4fJJZSMGnC784Oa6YVvq6TuTl0SDuDf5CT89kezosD+7clzNC/XCwuosf/
         BEk+lxTuHAShd9E+QU8f+hJh/wYVRb//tGjqgFrvQxR5hs2Uo4o/JC1i1Y0Hzdx+RZ3b
         YfFhShUWR6ua8aDZFLKF8G+xt1Ucd4pffy0/YIdY9FaO0F1ZuuaPCvcT5EwgWMwrZupJ
         FCR9D9ntwZZb8UL7IRe+ANauCXdCPaiK22+qU0DkunV0SpqXNTJhbVmxzXA3jci20/2L
         +pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779489526; x=1780094326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KaERKktJOUzP8jxu4iwBPFlbaa4OGX3jXfTdS7iBxk=;
        b=ZEx6R+AHcT0aHADOOFyZWRi5CZYt9iylSs8yL3uZG9R5v3Tate5c93D9Sf206cRcp4
         GtI7H19FYr45hwmqxpof5qLATmxdV22T+HtirzUW3VVMm6m/SUoszxtUYJ8ntv5nC3Od
         rFmCABeAW7ctZELs7aaR6GGdWKfz7/3E8VCNP4wLl0EgXgY9ss0hdle1avMtrZW8KOHE
         GNpAIURbBQH+RyqVPucyO36D8WDN+fMv++/g25dEnDQe6yK/VcJFziEParniRxSNb/YY
         zF7y7pnrIUnFgdOZGp2Eknbu1WaTB8yLCe0OBx2PhfBV8XdIRYE3j+8Rl3OMNNF2wn/u
         25mQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h5be0ZLrx5HimmlOjiw7i+ACQt64FCvJxYKK6fU2LB5l0mYfRsI/MtcnDLf8zEulXtAfmNjmaHmPK@lists.linux.dev
X-Gm-Message-State: AOJu0Yxynq176R0jZDR7xzc/zir1+5/iYsYzz3M513Fz62HSZasbOPcx
	nkgRonv+Zg+KDbr4QZvucVO8V+ePMseWJBU4j+9SZG2ocOXS4L0FkXyP4m3rQuJLxqFV8eiHzUh
	8jRerkYauIU1j9fZJnr/uNBbFIms71ss=
X-Gm-Gg: Acq92OFg3QweKsQZANg8hZu35HnW+iX8vIXqzdtgClVeQOVPg0gqZ4OHZiupMkpLe7i
	ryXQk9cCAcBhQEkeUBZmQEvhkoWIeGsF7EaYX1I0NuLUFqh9Xc+4510KUGtwFpZWeOVeaVBPkJW
	ZKRiyEcnWbVNMDog8S0U9gP2wjEoQKUW7MjA/uwGOhDQz/caHhmTmVi0yBHPIIp5fD79S/Ndhrf
	b/g/vlms0cTe8quJ2yktnKz8niWbqbfYAZpOXtMTSgaglLkdc7FMUlIGDyx8wIpJAqk6Xu/TfBo
	cyMrAQ==
X-Received: by 2002:a05:6000:2dc4:b0:43d:6244:f8b with SMTP id
 ffacd0b85a97d-45eb38a1b08mr9120552f8f.13.1779489525858; Fri, 22 May 2026
 15:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com> <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com>
In-Reply-To: <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 22 May 2026 15:38:34 -0700
X-Gm-Features: AVHnY4KkJVlWPboFn_YUuSCLdeEvnUffmsI8MNGnGyyAPJGHv1mu0f1qIljz6eQ
Message-ID: <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 2:51=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> Hi Joanne,
>
> On 5/22/26 23:14, Joanne Koong wrote:
> > On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> >>
> >> Changelog
> >> ---------
> >> v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joa=
nnelkoong@gmail.com/
> >> v2 -> v3:
> >> * Rework the uapis to be more ergonomic. Use io-uring registered buffe=
rs
> >>   infrastructure instead of doing pinning logic in fuse. Get rid of he=
ader
> >>   pinning as that makes no real perf difference
> >> * Rename from "buffer ring" to buffer pool. Logic is the same, just di=
fferent
> >>   naming
>
> short question, I didn't check the code is header pinning still
> *possible*? The problem if we do not pin headers is that
> io_uring_cmd_complete_in_task() cannot be avoided, as the application
> cannot write into fuse-server buffers and headers without pre-pinned
> pages. And io_uring_cmd_complete_in_task() basically means a context
> switch for all sync requests.

Hi Bernd,

Header pinning was dropped from this patchset. I have a separate
branch that has header pinning alongside the changes for avoiding the
fuse io_uring_cmd_complete_in_task() deferral. I moved the header
pinning changes out of this patchset as it doesn't tie in with getting
perf improvements from using registered buffers, unlike payload buffer
pinning.

>
> >
> > Just to reiterate, the logic is the same between this version and the
> > previous versions. I just renamed it to "buffer pool" to decouple the
> > implementation detail from the concept since it's uapi facing. The
> > buffer pool is managed as a buffer ring internally.
> >
> > Bernd, it would be much appreciated if you could take a look at this
> > series when you have the time. I'm targeting the June merge window and
> > the io-uring dependent changes have already been queued up in Jens's
> > tree since the last merge window.
>
> I will try and right is probably a good time, almost through with

Thanks!

> libfuse sync-init (remaining are bugs), Darricks series is also almost
> ready. Although I don't promise this weekend - reserved for Darrick and
> other libfuse changes.
>
> One piece I had been pondering a bit about, though did not dive into the
> code yet.
> What is if payload would be registered per ring entry (as without your
> changes) and just the header would become a buffer ring (so that could

I think payload buffers must be decoupled from ring entries if we want
to reduce memory usage in the non-zero-copy path.

> be pinned that way without loosing one page per entry)?  For zero-copy

For the header pinning changes in my branch, the headers are one
contiguous region (not per-entry), which circumvents having to
allocate one page per entry.

> we could register entries without a payload? Advantage here would be
> that that header buffer would determine max number of entries, only
> little memory would be needed for over-subscribed entries, but entries
> themselves could be registered dynamically on demand.

For zero-copy, entries still may have payloads (though the buffers
will definitely not need to be as big as the max payload size!),
either for the non-zero-copyable args or if the request's args aren't
page-backed. Unfortunately I think many servers may not be able to use
zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
ideal to minimize the memory consumption needed for the non-zero-copy
path, through the buffer pool for the payload buffers.

I hope I'm interpreting your question correctly - if not, please let me kno=
w!

Thanks,
Joanne

>
>
> Thanks,
> Bernd
>
> Thanks,
> Bernd
