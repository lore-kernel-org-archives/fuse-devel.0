Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461783D45E6;
	Thu, 15 Oct 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084930; cv=none; b=teVtnZi4w/AwUQeaAcYbp0O6m8MZruOkAvytsZ6FeZT7Fqc7DH42OhaEHF7rlTKEEN4KfqbZ8M/sxXfW/6neTbCBPjguusBgm0stXQzf2tMjDWKUsCwQQ3/qaSo0xCAZXGYwV1SIUkrqZYz8lpEfeaDt6owZijkv1C1mFEUFxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084930; c=relaxed/simple;
	bh=fnHA0kBi8gz8Wpn7OsY5DMjxWKnUBvEMoA86woVRSvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dwJ/f/8fdbFMuK0XIQnRrAmaxCUCv2cpbM3sDQGyDVYGMgObK6eurjuZ+JWzwPkyN4LXYNf3p133Ad6TK/t64+NEW3m/+slN80TrP7ryDMjMPql4X3y/fA2m1AmmUtCOfTGvOXO+ne/1EYRZjDC6wvPbBgjZKgAFmpv9uqc2YbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Abft2vv1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Abft2vv1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=GINtWLMOOv1hS4UDVnl5Kupqhy6uigJSecLtj7qEIws=; b=Abft2vv1KVq4QNsD1DbRatO1Vi
	Nl5LxzKQuAXeIdn5i4j95W/hY8/upt7UI2FaQzpdTU4X+1LQWszutYsXGE2qxAMzErUk57UqZoqvG
	mhsxGqxHn9jm4ZVrtnN156c5mPOhLnj5EBjdSzw/Vq0PLH6egDxNHGAy9brVTDL4L8lKWkas0kL0a
	zOLJBVQ6q6kAnC0xFyjvQyC+DgEbVBVVtwS38Eep5Ilrp4dM1v35ANqhwvzqfblWQ7z0GJ71ysoJ4
	2x7El6uI4QRF2iJDX8w6hm5iGoVY5Uh/rZlbzBIX3XIAMMjmKDhEDYUdnqTQvTWkulbM2PkDKmzh0
	6uQ1Qb9g==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xHP9Q-000efZ-Ja; Thu, 15 Oct 2026 19:21:56 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fuse: rename fuse_direct_io() to fuse_sync_direct_io()
In-Reply-To: <CAJfpegvdnPeyp8MYz9Y+v-nKNAj-J9N=nFyELfbB79nQJUiRQA@mail.gmail.com>
References: <20260904131838.15365-1-luis@igalia.com>
	<CAJfpegvdnPeyp8MYz9Y+v-nKNAj-J9N=nFyELfbB79nQJUiRQA@mail.gmail.com>
Date: Thu, 15 Oct 2026 18:23:13 +0100
Message-ID: <8733u6j2ta.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15 2026, Miklos Szeredi wrote:

> On Fri, 4 Sept 2026 at 15:17, Luis Henriques <luis@igalia.com> wrote:
>>
>> FUSE has two functions with very similar name: fuse_direct_io() and
>> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
>> the ambiguity.
>
> Intention is good, but fuse_sync_direct_io() is not the best name,
> because it's used for both sync and async direct IO.
>
> How about fuse_do_direct_io()?

OK, thanks for the suggestion.  I'll respin this patch with that name
instead.

Cheers,
--=20
Lu=C3=ADs
