Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64E395AC7
	for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 19:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501116; cv=none; b=R5CEeYucmD5M1rxpxtOIFSr/zJ3m77BoHslML5GXaDHIc5NI1DqqK7qMVuTwoqBIlyoG2/XKRyRfEdU/tG77c6YlHerCOU8SexyqymeW+EY/NKbYA84i+XMqIgVlyMsN2mzbmcmlMo/5twPRrtEeylinnfu7wCcORZTK0KEux3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501116; c=relaxed/simple;
	bh=It2cp5CUno77r4JWSpfFGIoSLOPqhYZLJ22RAHftcTw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C8eKLpTvtwmypure9HAxhogb2rtIacB+OO5w442GYdJkU3q9nF/iQhXYtYRERa/wRr/Nfd4NGfGnHI4sDfRRc9rDNP0YaDj9Dfq3G427UG/do+znjxzY0ICKQ9ZdfysTrvs0bFSAx2PeriDMHOkOwwHDNP78L6TlFCifD3VF0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=azsqmOW4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="azsqmOW4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2694B408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501114; bh=lOxOTFhxyL/btz+LrL5K7LMN/LtJOqdqA2nOs9DTUBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=azsqmOW4TnLsiSstMhC70wqBRb4oj9JbmS4k3IpVFWOd3wgXZVR8HMgoHT/vmOPFN
	 VdUTTD/6SuhrSWPzEuvFMeHX9gBtdtcvK4Pgp5SvLzFtGCoswXZfqK72DRlteK1q+J
	 Jw2UX7P7l7DHVQ7zwAIoPw5ttTavvA0aLAwCj0I92cx1WFv1YM/HX+yrwkMaIe8RZ3
	 7Twjcgh4NNr1ikJ5OqFBHPf85mLPtJeTAyeN/Xs9r87y6aC3bMmWyQskiXKDx8ykuk
	 IyeNX0HOt3U4UxaIz4ykvIbgfNqzKD4fnEe/cuRqrJ/XTuWKaKQoHiC67EtYLWGHSp
	 suLGyJmQVi9sw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2694B408B4;
	Tue, 15 Sep 2026 19:38:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Miklos Szeredi
 <miklos@szeredi.hu>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, fuse-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fuse: harmonize numeration
In-Reply-To: <20260902143541.703277-2-manuelebnerli@mailbox.org>
References: <20260902143541.703277-2-manuelebnerli@mailbox.org>
Date: Tue, 15 Sep 2026 13:38:33 -0600
Message-ID: <87qziu71ae.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Replace with '1.', '2.' with '1)', '2)' to harmonize file.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/filesystems/fuse/fuse.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
