Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B7391846
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876708; cv=none; b=jHu8qWUOEnYteRAdck2040Akpfp3vySy3dDG9hPJTU8JAfrl5we5hzZrtbyXCAYzXC2FaY/X36WzNpk30jFCu417yxBduQ3EFsdz681XEYZcirqGrjbMQydiwa3pd+pC+tZIaVe6NYDjdidKEfvbWeyvundF0SR+gmvTW9wCkRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876708; c=relaxed/simple;
	bh=XnlldDfXQiQamjM8TvCwymHLFpAiOZCQrzB5tYTkXI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rxaCNZIJI//LFBgXRc5IHk6PHXOPv2LuiMqdVqkoJBdh7L9pYe2CCkyOfaF4mTXwaQcBOOx0a8CllmBLCb11irQ3+BQhVWZwntHs4o8K481AbF8cdZM9bZGv+LQ3Lk7vUozrdxrqoTUCKCm+XYJ68Ixl7hp3LJ8DBbEQzESdqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VKW9IgVi; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VKW9IgVi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gYX2R5O+6baSKOCsmptbHpN/8d6r8/sFbFx9SNrlBlo=; b=VKW9IgVixkRgLsm09gQ4j7fs5U
	jEePipghr+xBfLjIQpjv3z17AK2LT5gkMTmb+hM03l8JiTE+6Ph0TYP1af0BQBvVW2l7GXPA1NFDa
	IJcghFFXIRVb74F2P+VfYpvgaReOnhMb39olLk1bpSKNeVtBS4AlxOTxcJqutpklg+lja+/eXeGrP
	p8ngUwnl0wRc/ESTpktD8LhN5KvxqZvIOwITZsdxzDrqCExkjTP7Xs2xHI58jUbWvm+uK6sN+nhbS
	QBJQd9wCCCwJDaMVwyLrqOoG4MK5zW8MbxZLw2tl7HIXA02laz02FnbUccSBWP5d4G3S+KcJULbfD
	2YMstlCA==;
Received: from bl16-25-64.dsl.telepac.pt ([188.81.25.64] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wNz5g-000gGJ-Rc; Fri, 15 May 2026 22:25:00 +0200
From: Luis Henriques <luis@igalia.com>
To: Jun Wu <quark@lihdd.net>
Cc: Joanne Koong <joannelkoong@gmail.com>,  fuse-devel@lists.linux.dev,  Jun
 Wu <quark@meta.com>
Subject: Re: [PATCH v2] fuse: invalidate readdir cache on epoch bump
In-Reply-To: <CAFfKmRW_Dqtb_DwAgK5Oq5kTAnGY6bmRpYP-Gw2+PVBtU4YVtQ@mail.gmail.com>
	(Jun Wu's message of "Fri, 15 May 2026 10:43:17 -0700")
References: <20260331223927.763741-1-quark@lihdd.net>
	<20260515001412.1270472-1-quark@lihdd.net> <8733ztt5o8.fsf@igalia.com>
	<CAJnrk1YKmF29r0qr6ouKHqYTbKC-OR256aa=T+zHsU7jeTtQPQ@mail.gmail.com>
	<87mry0skpy.fsf@igalia.com>
	<CAFfKmRW_Dqtb_DwAgK5Oq5kTAnGY6bmRpYP-Gw2+PVBtU4YVtQ@mail.gmail.com>
Date: Fri, 15 May 2026 21:25:02 +0100
Message-ID: <87cxyws9nl.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 15 2026, Jun Wu wrote:

> Thanks for your review! I think my DNS records had expired when sending,
> and retrying after fixing the DNS didn't help. I will resend with a regul=
ar
> Gmail address.

Awesome, thanks.  I can confirm v3 is now on the mailing-list, though this
email I'm replying to seems to have been dropped again :-)

Cheers,
--=20
Lu=C3=ADs


>
> Regards,
> Jun
>
> On Fri, May 15, 2026 at 9:26=E2=80=AFAM Luis Henriques <luis@igalia.com> =
wrote:
>
>> On Fri, May 15 2026, Joanne Koong wrote:
>>
>> > On Fri, May 15, 2026 at 1:53=E2=80=AFAM Luis Henriques <luis@igalia.co=
m> wrote:
>> >>
>> >> On Thu, May 14 2026, Jun Wu wrote:
>> >>
>> >> > From: Jun Wu <quark@meta.com>
>> >> >
>> >> > FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate
>> cached
>> >> > readdir results. A process with cwd inside a FUSE mount can therefo=
re
>> >> > observe stale readdir(".") output after an epoch bump.
>> >> >
>> >> > Fix this by recording epoch in the readdir cache and checking it on
>> reuse.
>> >> >
>> >> > Minimal reproducer:
>> >> >
>> >> > - mount a tiny FUSE fs with an empty root directory
>> >> > - on opendir, enable fi->cache_readdir and fi->keep_cache
>> >> > - chdir into the mount and call readdir(".") to populate readdir ca=
che
>> >> > - make the FUSE server report one file in the root directory
>> >> > - send only FUSE_NOTIFY_INC_EPOCH
>> >> > - call readdir(".") again; before this change it stays stale, after
>> this
>> >> >   change it sees the new file
>> >> >
>> >> > Fixes: 2396356a945b ("fuse: add more control over cache invalidation
>> behaviour")
>> >> > Signed-off-by: Jun Wu <quark@meta.com>
>> >
>> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>> >
>> > (btw, I think your v2 email may have gotten corrupted when sending. I
>> > wasn't able to find it in my inbox and had to manually import Luis's.
>> > I'm not seeing it show up on lore [1] either)
>>
>> Hmm... yeah, looks like there's something funny with his email.  The mail
>> server I use seems to be more tolerant than lore regarding incorrect
>> email.  So maybe lore blocked it because the domain and the smtp server
>> address don't match...?  Anyway, maybe it's worth resending so that
>> everyone can see it.
>>
>> Cheers,
>> --
>> Lu=C3=ADs
>>
>
>
> --=20
> WU Jun
> <quark@lihdd.net>

