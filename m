Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F583E0097
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862371; cv=none; b=myDZoRwgw+Y2bgtueuBgn1YoAYlz4/dxB4zs2EyhLDE6d8/sivzm4AxyrNQM2ijKMph3BHuHIRnUHsBXzQY4bAzXKMkKUrOzod092EvGByPUYcSVNOzSGS3k265idM2bWx717DiwmJAYOu/sl7Q+Epk+nIl5Kf7oNRK/aYfvTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862371; c=relaxed/simple;
	bh=RwNJ5AhPZfdX5RxxQhEeqUTOoNvlrwqXpl7JrmVxRkM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GcEsGG5zY1C6bkVokRJF8mu1KYPh/vzra4yIfKpggvbqRRy41/9+JpFHE32avQvr017FWpP4pdSQGbNmjFeux/zhOSloXxIJhsj1ydiI1N0meyntzczf3TpK/qeQfYOB2OYIEQ0g8I6kd69jve9Tow7jUz8GjheFgGxp5QjS0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=F/sdfX/y; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="F/sdfX/y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=o94HvLdKyj1vHVKLmr4kVqxAgHPNRjxG60XA0+wQQYY=; b=F/sdfX/yFtnnOJnC87svASs2ok
	J2YQjXPAShUhAFHTBt3Vzm7NoHfi2Jka2j22qY6fr5dNIJwD8l6xYQCq/RfKqyz+/We73ilSc5xDm
	AemS4WnTYZryCQcQZzglr3o1faPhovpJ8ZmKWqGLwhWclEHVFX+ya5BlRtnds0eBpcmO/6+d1Wx5K
	NPczsHeBeTbm/IYoNRbcZ2TCAYGHg6xqRfIyllBz5h9Sskk/EvE6ZKJO4DhkztAl/Eau0GkQFZWx/
	xrgQq0JCAUECOxjLdfAwreWW5AVdwQPXCwsknA9J0LGnaJk/qQrVKL9bKBXSvPzu060hX3S/PONRn
	poN1Y7eQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wNvMR-000b6r-HR; Fri, 15 May 2026 18:26:03 +0200
From: Luis Henriques <luis@igalia.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Jun Wu <quark@lihdd.net>,  fuse-devel@lists.linux.dev,
  miklos@szeredi.hu,  Jun Wu <quark@meta.com>
Subject: Re: [PATCH v2] fuse: invalidate readdir cache on epoch bump
In-Reply-To: <CAJnrk1YKmF29r0qr6ouKHqYTbKC-OR256aa=T+zHsU7jeTtQPQ@mail.gmail.com>
	(Joanne Koong's message of "Fri, 15 May 2026 08:36:34 -0700")
References: <20260331223927.763741-1-quark@lihdd.net>
	<20260515001412.1270472-1-quark@lihdd.net> <8733ztt5o8.fsf@igalia.com>
	<CAJnrk1YKmF29r0qr6ouKHqYTbKC-OR256aa=T+zHsU7jeTtQPQ@mail.gmail.com>
Date: Fri, 15 May 2026 17:26:01 +0100
Message-ID: <87mry0skpy.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 15 2026, Joanne Koong wrote:

> On Fri, May 15, 2026 at 1:53=E2=80=AFAM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> On Thu, May 14 2026, Jun Wu wrote:
>>
>> > From: Jun Wu <quark@meta.com>
>> >
>> > FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate ca=
ched
>> > readdir results. A process with cwd inside a FUSE mount can therefore
>> > observe stale readdir(".") output after an epoch bump.
>> >
>> > Fix this by recording epoch in the readdir cache and checking it on re=
use.
>> >
>> > Minimal reproducer:
>> >
>> > - mount a tiny FUSE fs with an empty root directory
>> > - on opendir, enable fi->cache_readdir and fi->keep_cache
>> > - chdir into the mount and call readdir(".") to populate readdir cache
>> > - make the FUSE server report one file in the root directory
>> > - send only FUSE_NOTIFY_INC_EPOCH
>> > - call readdir(".") again; before this change it stays stale, after th=
is
>> >   change it sees the new file
>> >
>> > Fixes: 2396356a945b ("fuse: add more control over cache invalidation b=
ehaviour")
>> > Signed-off-by: Jun Wu <quark@meta.com>
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> (btw, I think your v2 email may have gotten corrupted when sending. I
> wasn't able to find it in my inbox and had to manually import Luis's.
> I'm not seeing it show up on lore [1] either)

Hmm... yeah, looks like there's something funny with his email.  The mail
server I use seems to be more tolerant than lore regarding incorrect
email.  So maybe lore blocked it because the domain and the smtp server
address don't match...?  Anyway, maybe it's worth resending so that
everyone can see it.

Cheers,
--=20
Lu=C3=ADs
