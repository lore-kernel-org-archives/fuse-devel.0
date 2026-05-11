Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1D402B92
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512377; cv=pass; b=JpUDSTnIKzGOvtmGqmFbqMTjsyR/iL7XfLBFPfqMthBqd58YvNSAd/5gccq/UkzHs5y1odIE7OrKXVwQ2wB7Mm2G90gMS5y4wYmeTfTIRLDZg9OsGPLE4qZ1OlMe8vm/+PFCQltWpztuh3T5BmYD/dmCrD5MgNu7n7/RG+lDD2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512377; c=relaxed/simple;
	bh=aathsBnbkgVaFXNMwT/mok0vKqK3XEdX4/Ft8nMtbCI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ILg7GvpwbXLkWy6FtJ0F00fXgqpLjxX8HbSZkCdzc7dnrFkT8wzo2beEKy38ZW6N0avnE/eSZaO8Xqq4ABlLBqB1sUOA9NNdZZK4b0LHfVulhimAMs73bzio1ff/MZxKS2qnkD3QfRav2X0YEf/PTtCnML9kTw7JsTl6twbGcvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=W7FhfAYD; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="W7FhfAYD"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1332772f6b3so745247c88.1
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 08:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778512375; cv=none;
        d=google.com; s=arc-20240605;
        b=QMJ15sU+6OcQuxSsPUwB+WBChcEbgzQYfV5lD//wq4GT/GqeQ0vjQP+B1x5FmKdSjK
         NGaG0z6vcaGIJCllX8Nyg6+NfCkWRmj6KUUsHtnhjJiO1w+t62yJlFRd7QcEbzQZdoeq
         79XYOdRv//4/PQ8o6edD2Lu8cf8TLxUQHcmlRFRzp3FkXR9CVnV7r16AgdNxbTMAJ1wE
         PFn/BpFw7Nws9KIBk5kuXurMe/B4X6+Uht4ZxG+mFGOGQnp/GVOG+lrhrFmeyyojlgmg
         NK/44Q3jRG4IqyID7cqJcT3ombMXKqvVrhk6kxVFGQJltpQv3Z/Qt1zABsw1kPKDZcc5
         qLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=DVj8x9VSZBK8vc/OEq+ZAApJltFoV5zCcZWj9ipEgF8=;
        fh=iRnN5jp8ufaruPxmsHW+K3ox1pPm2f+/q5h7eKCxDDE=;
        b=HMUsC3AvoBJAxoxJW/zPB8VCWKXDCvejQadRBP9WttXanTnULSpiCNIpg0F4kyHXF3
         0nPyyahfJcIY6o6ISKERAssLTDTlTuBmOqz/J2UMHEuDqLAY7VOJhDgK329c39wZAk5B
         OcI8HJiHua4Rv0/tw11/bfeXofT6q7PrJKWdnEE52BLfJoJna5bIaczwlUoSNz915D9t
         XzfWN4dXYhbik5RXgLZcbqYccMt3D2dEz/uzewzebSpbAdoLQgfd/YER2EEiCCnLm38b
         QrqNRc31uPzrHNhsdqGYq5gPCgUcAEGTrseeNUQ3KsxPr0czBuVFSvhe71LjBoP0bVGJ
         T7Hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778512375; x=1779117175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVj8x9VSZBK8vc/OEq+ZAApJltFoV5zCcZWj9ipEgF8=;
        b=W7FhfAYDY+nspeHnnW4yJx4tJRliidiXvQlqi5H4HgY4A9a95KXRupP7wQQ7/2JU/A
         AaTI0nX5fDVKYLTh/ZqoVN2lx4ib8AyXMZDQ96pnnxXn5X66uWl8ku3y1wGl6F/LzWIo
         q7pQqGN5bynR/TgQqLK6X14FfkrkTDroNWLJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512375; x=1779117175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVj8x9VSZBK8vc/OEq+ZAApJltFoV5zCcZWj9ipEgF8=;
        b=QbT0GvHzWALm3K/kaLcV9BhB1Th2Svs4hzyeMxak7eTuALIDP4L/1Ssonius2fLMmF
         8+qYT9nOUEr2AGPS0W3liRNgDMH1hSUyj/TttcgNesw89wGv1sQQYwQZAnSwtjgQ03HO
         nePXXkRhnVxKG9qMvkgxptxRkU5onfkJwyVL0+4JRvpbpe2TKMyq1vNnZQeCt7dXhOBT
         S2LtAe8I0NCIfWYuB3Lt5PtLGjKJTMZN5z+a+JSAyy2+Ow9tOe3v5ueDrBcvPsXihTTz
         zg+7Gv34upC4c+SH6sqSZL3DwJuMcK8ImcCKtQrXs6iz9oCO6dOBUACMtF7Mdthp0wg6
         JceA==
X-Gm-Message-State: AOJu0Yz84fezJ9FYnprRfUKNkM91zsTjcZQWQZ2sKkT9so6tCqY9FG+9
	pRinYCSyGLciu9Rq/l/P6c1GeyOHuwfd9i0hb6w8TH7yitMRjYXI7pTNRHaVcg1YPtZIyqMWQrD
	0ygKycZpY64WNJlNPJD69wqxXIuiiXWqZ8B1zjoot9sieuAys+ltu7NY=
X-Gm-Gg: Acq92OHxES1d2rOv00lKDKYjLp1xrda3gdTG+e9yvYlVoWBiCIq0L0pW4kWo7WMyNYv
	1stw6psrEuKZrhYQEzK80VqNwWtqRNSKOxz4326bzUq/xrRtC2L3aXpLVeALcEej4Fqqqm5pND0
	PV2fHvOniMfol/ychZ0SmcF+NK5ClMA1Vs3jyhcmPBi6CFHUYic3sXHluFx4dDGL9DHNqNOYKms
	iiP/XxL+blX+jv8dDslZi+COvZWSRGpIbvWk52YLmRgzSJ858Ot7sa1dOHAmGSmp+diOMn8ELvc
	KZYS78vyTg9iteOAfJ7LLuhnojrRMEEMWfJKq4w=
X-Received: by 2002:a05:7022:21d:b0:12a:8ea4:252 with SMTP id
 a92af1059eb24-1317d893837mr11382095c88.4.1778512374558; Mon, 11 May 2026
 08:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 11 May 2026 17:12:42 +0200
X-Gm-Features: AVHnY4LKCTGBPV2-IauLL9M0mSqYuUvrkz-If8dEIBj4Tl7aLqbo-Tkqp3iU-Q8
Message-ID: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
Subject: [post LSFMM summary] where is fuse going?
To: fuse-devel <fuse-devel@lists.linux.dev>
Cc: linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please let know what I missed.

CO-MAINTAINER:  Position still open, though we formalized some
subsystem maintainership roles, sent MAINTAINERS patch.

FAMFS: Let's try to find some common ground between the fuse-iomap api
and the famfs api.  I.e. add striping as a generic mapping method,
even though normal filesystems don't (currently) use it.  Using BPF is
a bad idea.

FUSE-IOMAP: Need to reduce the scope of the patchset further, as no
one can sanely review it.  Idea: first just implement static maps
(i.e. read-or-re-write-only).  This should be much simpler, yet could
demonstrate a read-only mount of ext4, right?

COMPOUND REQS: let's add this to fusex.  uAPI is simple, kAPI needs refinin=
g.

FILE HANDLES: same: let's add to fusex.

URING BUFFER MANAGEMENT: there's a disagreement between Joanne and
Bernd about this.  I think we first need a very high level description
of each solution and why it's preferred over the other.

LARGE FOLIOS: depends on !strictlimit.  I don't have a good enough
understanding of writeback throttling to decide whether removing the
strictlimit requirement for unprivileged fuse is okay or not.  Need
more analysis.

FUSEX: there was approval for the idea of using this as a uAPI major
version update.  In other words fusex will gain feature parity with
legacy fuse, but with a more consistent interface.

MAILING LIST: we have a shiny new one, there was agreement that it's
sufficient for normal fuse discussion and patch posting, and usually
there's no need to cross post linux-fsdevel.

Amir asked about how long it took for overlayfs to go upstream.  Well,
I looked up both fuse and overlayfs:

fuse first release: Nov 2001
fuse merge: Sep 2005

ovl first patchset: Aug 2010
ovl merge: Oct 2014

Both 4 years =C2=B12 months.

So don't despair! There's light at the end of the tunnel (and
hopefully not the oncoming train ;)

Thanks,
Miklos
